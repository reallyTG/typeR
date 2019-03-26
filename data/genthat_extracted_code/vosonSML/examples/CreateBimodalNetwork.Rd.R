library(vosonSML)


### Name: CreateBimodalNetwork
### Title: Note: this function is DEPRECATED and will be removed in a
###   future release. Please use the 'Create' function
### Aliases: CreateBimodalNetwork
### Keywords: SNA bimodal igraph media network social

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
##D   # Run the `CollectDataFacebook` function and store the results in variable `myFacebookData`
##D   myFacebookData <- CollectDataFacebook(pageName="StarWars", rangeFrom="2014-05-15",
##D   rangeTo="2014-06-03",writeToFile=FALSE,verbose=TRUE)
##D 
##D   # Create a 'bimodal' network using \code{CreateBimodalNetwork}
##D   g_bimodal_facebook <- CreateBimodalNetwork(myFacebookData)
##D 
##D   # View descriptive information about the bimodal network
##D   g_bimodal_facebook
## End(Not run)




