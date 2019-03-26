library(Rfacebook)


### Name: getShares
### Title: Extract list of users who publicly shared a public Facebook post
### Aliases: getShares

### ** Examples

## Not run: 
##D ## See examples for fbOAuth to know how token was created.
##D ## Getting information about Facebook's Facebook Page
##D load("fb_oauth")
##D fb_page <- getPage(page="facebook", token=fb_oauth)
##D ## Getting shares of most recent post
##D shares <- getShares(post=fb_page$id[1], n=2000, token=fb_oauth)
## End(Not run)




