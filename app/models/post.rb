class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :not_clickbait


    def not_clickbait
        if !title.nil?
          if !title.include? "Won't Believe" ||'Secret'|| "Top [number]"|| "Guess"
        errors.add(:title, "clickbait failed")
        end
      end
    end
end
