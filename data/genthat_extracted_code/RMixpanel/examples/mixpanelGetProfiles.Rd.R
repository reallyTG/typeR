library(RMixpanel)


### Name: mixpanelGetProfiles
### Title: Get Profiles From Mixpanel API
### Aliases: mixpanelGetProfiles
### Keywords: mixpanel people

### ** Examples

## Not run: 
##D ## Fill in here the API token, key and secret as found on 
##D ## www.mixpanel.com - Account -> Projects. 
##D account = mixpanelCreateAccount("ProjectName",
##D                                 token="c12g3...",
##D                                 secret="168e7e...", 
##D                                 key="543c55...")
##D                                 
##D profiles = mixpanelGetProfiles(account, where='properties["KPI1"] > 1.32', 
##D                              select=c("KPI1", "KPI2"))
##D print(profiles)
## End(Not run)


