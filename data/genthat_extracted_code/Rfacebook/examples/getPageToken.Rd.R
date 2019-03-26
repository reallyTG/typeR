library(Rfacebook)


### Name: getPageToken
### Title: Get a page access token
### Aliases: getPageToken

### ** Examples

## Not run: 
##D ## Get a normal access token with manage_pages scope
##D token = fbOAuth(app_id, app_secret, scope="manage_pages")
##D ## Get a page access token for a page
##D page_token = getPageToken(page, token)
##D ## Get page insights
##D getInsights(page, token=page_token, metric = "page_impressions")
## End(Not run)



