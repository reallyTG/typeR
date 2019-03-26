library(Rfacebook)


### Name: getPost
### Title: Extract information about a public Facebook post
### Aliases: getPost

### ** Examples

## Not run: 
##D ## See examples for fbOAuth to know how token was created.
##D ## Getting information about Facebook's Facebook Page
##D load("fb_oauth")
##D fb_page <- getPage(page="facebook", token=fb_oauth)
##D ## Getting information and likes/comments about most recent post
##D post <- getPost(post=fb_page$id[1], n=2000, token=fb_oauth)
## End(Not run)




