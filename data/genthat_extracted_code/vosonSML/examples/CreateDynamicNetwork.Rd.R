library(vosonSML)


### Name: CreateDynamicNetwork
### Title: Note: this function is DEPRECATED and will be removed in a
###   future release. Please use the 'Create' function
### Aliases: CreateDynamicNetwork
### Keywords: SNA dynamic igraph media network social

### ** Examples


## Not run: 
##D   ## This example shows how to collect Facebook page data and create a bimodal network
##D 
##D   # Use your own values for myAppID and myAppSecret
##D   myAppID <- "123456789098765"
##D   myAppSecret <- "abc123abc123abc123abc123abc123ab"
##D 
##D   # Authenticate with the Facebook API using `AuthenticateWithFacebookAPI`
##D   fb_oauth <- AuthenticateWithFacebookAPI(appID=myAppID, appSecret=myAppSecret,
##D     extended_permissions=FALSE, useCachedToken=TRUE)
##D 
##D   # Run the `CollectTemporalDataFacebook` function and
##D   # store the results in variable `myTemporalFacebookData`
##D   myTemporalFacebookData <- CollectTemporalDataFacebook(pageName="StarWars",
##D     rangeFrom="2015-05-14",rangeTo="2015-06-04",verbose=FALSE,writeToFile=FALSE)
##D 
##D   # Create a dynamic 'bimodal' Facebook network using `CreateDynamicNetwork`
##D   g_bimodal_dynamic_facebook <- CreateDynamicNetwork(myTemporalFacebookData)
##D 
##D   # View descriptive information about the bimodal network
##D   g_bimodal_facebook
## End(Not run)



