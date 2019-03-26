library(RMixpanel)


### Name: plot.retention
### Title: Plot Retention Rates
### Aliases: plot.retention
### Keywords: mixpanel addiction retention plot

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
##D                      
##D par(mfrow=c(2, 2))
##D plot(ret, type="all")
##D par(mfrow=c(1, 1))
## End(Not run)


