library(RMixpanel)


### Name: mixpanelUpdateProfile
### Title: Update Mixpanel Profile
### Aliases: mixpanelUpdateProfile
### Keywords: mixpanel people profile

### ** Examples

## Not run: 
##D ## Fill in here the API token, key and secret as found on 
##D ## www.mixpanel.com - Account -> Projects. 
##D account = mixpanelCreateAccount("ProjectName",
##D                                 token="c12g3...",
##D                                 secret="168e7e...", 
##D                                 key="543c55...")
##D                                 
##D mixpanelUpdateProfile(
##D   account, 
##D   "11b9c243-4ea3...",  
##D   data=list( 
##D     "$set"=list(day=jsonlite::unbox(12), 
##D                 month=jsonlite::unbox(3), 
##D                 "$name"=jsonlite::unbox("Dummy name")),
##D     "$setOnce"=list(installYear=2016),
##D     "$unset"=c("oldProp1", "oldProp2"),
##D     "$union"=list(month=10:12)
##D     ## "$delete": ""    ## !!! Delete user. !!!
##D   )
##D )
## End(Not run)


