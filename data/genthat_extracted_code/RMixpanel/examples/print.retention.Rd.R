library(RMixpanel)


### Name: print.retention
### Title: Print Retention Matrix
### Aliases: print.retention
### Keywords: mixpanel addiction retention

### ** Examples

## Not run: 
##D ## Fill in here the API token, key and secret as found on 
##D ## www.mixpanel.com - Account -> Projects. 
##D account = mixpanelCreateAccount("ProjectName",
##D                                 token="c12g3...",
##D                                 secret="168e7e...", 
##D                                 key="543c55...")
##D ret = mixpanelGetRetention(account, born_event="AppInstall", event="WatchedItem", 
##D                      from=20150701, to=20151101, unit="week")
##D print(ret, percentages=FALSE)
##D print(ret, percentages=TRUE)
## End(Not run)


