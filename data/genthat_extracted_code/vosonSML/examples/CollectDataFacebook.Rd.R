library(vosonSML)


### Name: CollectDataFacebook
### Title: Note: this function is DEPRECATED and will be removed in a
###   future release. Please use the 'Collect' function
### Aliases: CollectDataFacebook
### Keywords: SNA data facebook mining

### ** Examples


## Not run: 
##D   ## Use your own values for myAppID and myAppSecret
##D   appID <- "xxxx"
##D   appSecret <- "yyyy"
##D 
##D   ## Collect data and create bimodal network
##D 
##D   g_bimodal_facebook_star_wars <- Authenticate("Facebook",
##D   appID = appID, appSecret = appSecret) %>%
##D   SaveCredential("FBCredential.RDS") %>%
##D   Collect(pageName="StarWars", rangeFrom="2015-03-01",
##D   rangeTo="2015-03-02", writeToFile=FALSE) %>%
##D   Create("Bimodal")
##D 
##D   ## Create a dynamic network using the saved credentials
##D 
##D   g_bimodal_facebook_star_wars_dynamic <-
##D   LoadCredential("FBCredential.RDS") %>%
##D   Collect(pageName="StarWars", rangeFrom="2015-03-01",
##D   rangeTo="2015-03-02", writeToFile=FALSE) %>%
##D   Create("dynamic")
## End(Not run)



