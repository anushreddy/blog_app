require "rails_helper"

RSpec.feature "Showing Articles" do
  before do
    @article = Article.create(title: "The first article", body: "Body of first article")
  end

  scenario "A user shows an Article" do
    visit "/"
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end
end