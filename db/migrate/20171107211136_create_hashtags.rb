class CreateHashtags < ActiveRecord::Migration[5.1]
  def change
    create_table :hashtags do |t|
      t.string :tag, index: {unique: false}

      t.timestamps
    end

    create_table :hashtags_tweets, id: false do |t|
      t.belongs_to :hashtag, index: true
      t.belongs_to :tweet, index: true
    end

    add_index(:tweets, :created_at)
  end
end
