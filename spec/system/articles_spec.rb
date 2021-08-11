require 'rails_helper'

RSpec.describe "Articles", type: :system do
  let(:title) { 'ポケモン' }
  let(:content) { 'ダイパのリメイクほしいなぁ' }
  before do
    @article = Article.create!(title: title, content: content)
  end

  it 'new' do
    visit edit_article_path(@article)

    # 誤
    # expect(page).to have_field 'title', with: title
    # have_fieldがtitleだけだと以下エラー、モデル名なんとかならんのか。
    # Failure/Error: expect(page).to have_field 'title', with: title
    # expected to find field "title" that is not disabled but there were no matches

    # 正
    # 特に何も設定してないけどテスト実行したらchromeが起動してくれた
    expect(page).to have_field 'article[title]', with: title

    # 何も設定いじってないけど、テスト失敗したら tmp/screenshots に失敗したときの画像置いてくれる
  end
end
