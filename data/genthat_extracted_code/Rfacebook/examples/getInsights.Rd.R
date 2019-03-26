library(Rfacebook)


### Name: getInsights
### Title: Extract Insights metric from a Facebook page (admin role
###   required)
### Aliases: getInsights

### ** Examples

## Not run: 
##D ## See examples for fbOAuth to know how token was created.
##D ## Getting page impressions for Facebook's Facebook Page
##D ## (only owner or admin of page)
##D  load("fb_oauth")
##D insights <- getInsights(object_id="20531316728", token=fb_oauth, metric='page_impressions')
##D ## Getting post impressions for a random Facebook's page post
##D ## (only owner or admin of page)
##D  insights <- getInsights(object_id='221568044327801_754789777921289', 
##D      token=fb_oauth, metric='post_impressions', period='days_28')
##D ## Getting page fans for date range
##D ## (only owner or admin of page)
##D insights <- getInsights(object_id='221568044327801',
##D     token=fb_oauth, metric=c'page_fans', period='lifetime', 
##D     parms='&since=2015-01-01&until=2015-01-31', version=2.5)
##D #' ## Getting page fans AND page impressions for date range
##D ## (only owner or admin of page)
##D insights <- getInsights(object_id='221568044327801',
##D     token=fb_oauth, metric=c('page_fans','page_impressions'), period=c('lifetime','day'), 
##D     parms='&since=2015-01-01&until=2015-01-31')        
##D ## Count of fans by country
##D   insights <- getInsights(object_id='221568044327801_754789777921289', 
##D      token=fb_oauth, metric='page_fans_country', period='lifetime')
## End(Not run)




