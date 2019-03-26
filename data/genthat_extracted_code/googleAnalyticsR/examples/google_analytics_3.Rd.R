library(googleAnalyticsR)


### Name: google_analytics_3
### Title: Get Google Analytics v3 data (formerly google_analytics())
### Aliases: google_analytics_3

### ** Examples


## Not run: 
##D 
##D library(googleAnalyticsR)
##D 
##D ## Authenticate in Google OAuth2
##D ## this also sets options
##D ga_auth()
##D 
##D ## if you need to re-authenticate use ga_auth(new_user=TRUE)
##D ## if you have your own Google Dev console project keys,
##D ## then don't run ga_auth() as that will set to the defaults.
##D ## instead put your options here, and run googleAuthR::gar_auth()
##D 
##D ## get account info, including View Ids
##D account_list <- google_analytics_account_list()
##D ga_id <- account_list$viewId[1]
##D 
##D ## get a list of what metrics and dimensions you can use
##D 
##D meta <- google_analytics_meta()
##D head(meta)
##D 
##D ## pick the account_list$viewId you want to see data for.
##D ## metrics and dimensions can have or have not "ga:" prefix
##D 
##D gadata <- google_analytics(id = ga_id,
##D                            start="2015-08-01", end="2015-08-02",
##D                            metrics = c("sessions", "bounceRate"),
##D                            dimensions = c("source", "medium"))
##D                        
##D  ## multi accounts, pass character vector of viewIds
##D  ## outputs a list of data.frames, named after the viewId
##D  multi_gadata <- google_analytics(id = c("123456","9876545","765432"),
##D                                   start="2015-08-01", end="2015-08-02",
##D                                   metrics = c("sessions", "bounceRate"),
##D                                    dimensions = c("source", "medium"))
##D                                 
##D ## if more than 10000 rows in results, auto batching
##D ## example is setting lots of dimensions to try and create big sampled data
##D batch_gadata <- google_analytics(id = ga_id,
##D                                  start="2014-08-01", end="2015-08-02",
##D                                  metrics = c("sessions", "bounceRate"),
##D                                  dimensions = c("source", "medium", 
##D                                                "landingPagePath",
##D                                                "hour","minute"),
##D                                 max=99999999)
##D 
##D ## mitigate sampling by setting samplingLevel="WALK"
##D ## this will send lots and lots of calls to the Google API limits, beware
##D walk_gadata <- google_analytics(id = ga_id,
##D                                 start="2014-08-01", end="2015-08-02",
##D                                 metrics = c("sessions", "bounceRate"),
##D                                 dimensions = c("source", "medium", "landingPagePath"),
##D                                 max=99999999, samplingLevel="WALK")
##D                                 
##D ## multi-channel funnels set type="mcf"
##D mcf_gadata <- google_analytics(id = ga_id,
##D                                start="2015-08-01", end="2015-08-02",
##D                                metrics = c("totalConversions"),
##D                                dimensions = c("sourcePath"),
##D                                type="mcf")
##D 
##D 
##D ## reach meta-data via attr()
##D attr(gadata, "profileInfo")
##D attr(gadata, "dateRange")
##D 
##D 
## End(Not run)




