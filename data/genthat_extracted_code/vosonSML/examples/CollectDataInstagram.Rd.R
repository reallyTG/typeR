library(vosonSML)


### Name: CollectDataInstagram
### Title: Note: this function is DEPRECATED and will be removed in a
###   future release. Please use the 'Collect' function
### Aliases: CollectDataInstagram
### Keywords: SNA data instagram mining

### ** Examples


## Not run: 
##D ## Use your own values for myAppID and myAppSecret
##D myAppID <- "123456789098765"
##D myAppSecret <- "abc123abc123abc123abc123abc123ab"
##D 
##D # Authenticate with the Instagram API using `AuthenticateWithInstagramAPI`
##D instagram_oauth_token <- AuthenticateWithInstagramAPI(appID=app_id, appSecret=app_secret,
##D   useCachedToken=TRUE)
##D 
##D # EXAMPLE 1
##D 
##D # Run the `CollectDataInstagram` function and store the results in variable `myInstagramData`
##D # (searching by hashtag)
##D myInstagramData <- CollectDataInstagram(tag="obama", distance=5000, n=100, folder=NULL,
##D verbose=TRUE, waitForRateLimit=TRUE)
##D 
##D # Create a 'bimodal' network using \code{CreateBimodalNetwork}
##D g_bimodal_instagram_obama <- CreateBimodalNetwork(myInstagramData,writeToFile=F)
##D 
##D # View descriptive information about the bimodal network
##D g_bimodal_instagram_obama
##D 
##D # EXAMPLE 2
##D 
##D # Run the `CollectDataInstagram` function and store the results in variable `myInstagramData`
##D # (searching by coordinates in Brisbane (Australia) with a radius of 5km)
##D myInstagramData <- CollectDataInstagram(lat=-27.4701, lng=153.0220, distance=5000, n=100,
##D   folder=NULL, verbose=TRUE, waitForRateLimit=TRUE)
##D 
##D # Create a 'bimodal' network using \code{CreateBimodalNetwork}
##D g_bimodal_instagram_brisbane <- CreateBimodalNetwork(myInstagramData,writeToFile=F)
##D 
##D # View descriptive information about the bimodal network
##D g_bimodal_instagram_brisbane
## End(Not run)



