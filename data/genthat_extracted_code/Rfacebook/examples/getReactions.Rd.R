library(Rfacebook)


### Name: getReactions
### Title: Extract total count of reactions to one or more Facebook posts
### Aliases: getReactions

### ** Examples

## Not run: 
##D ## See examples for fbOAuth to know how token was created.
##D ## Getting information about Facebook's Facebook Page
##D load("fb_oauth")
##D fb_page <- getPage(page="facebook", token=fb_oauth)
##D ## Getting reactions for most recent post
##D post <- getReactions(post=fb_page$id[1], token=fb_oauth)
## End(Not run)




