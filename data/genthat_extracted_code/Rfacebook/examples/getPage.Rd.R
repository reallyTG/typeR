library(Rfacebook)


### Name: getPage
### Title: Extract list of posts from a public Facebook page
### Aliases: getPage

### ** Examples

## Not run: 
##D ## See examples for fbOAuth to know how token was created.
##D ## Getting information about Facebook's Facebook Page
##D  load("fb_oauth")
##D  fb_page <- getPage(page="facebook", token=fb_oauth)
##D ## Getting posts on Humans of New York page, including posts by others users
##D ## (not only owner of page)
##D  page <- getPage(page="humansofnewyork", token=fb_oauth, feed=TRUE)
##D ## Getting posts on Humans of New York page in January 2013
##D  page <- getPage(page="humansofnewyork", token=fb_oauth, n=1000,
##D    since='2013/01/01', until='2013/01/31')
## End(Not run)




