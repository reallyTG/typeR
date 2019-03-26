library(Rfacebook)


### Name: getCommentReplies
### Title: Extract replies to comments on page post
### Aliases: getCommentReplies

### ** Examples

## Not run: 
##D ## See examples for fbOAuth to know how token was created.
##D ## Getting information about Facebook's Facebook Page
##D  load("fb_oauth")
##D  fb_page <- getPage(page="facebook", token=fb_oauth)
##D ## Getting information and likes/comments about most recent post
##D  post <- getPost(post=fb_page$id[1], n=2000, token=fb_oauth)
##D ## Downloading list of replies to first comment
##D  replies <- getCommentReplies(comment_id=post$comments$id[1], token=fb_oauth)
## End(Not run)




