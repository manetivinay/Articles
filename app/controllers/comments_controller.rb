class CommentsController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "admin", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(create_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)

  end

  private
    def create_params
      # code here
      params.require(:comment).permit(:commenter, :body)
    end
end
