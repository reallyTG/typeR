library(vosonSML)


### Name: importData
### Title: Import vosonSML data previously saved to disk using the
###   'Collect()' function.
### Aliases: importData

### ** Examples


## Not run: 
##D require(magrittr)
##D ## Facebook example
##D 
##D # Specify your API keys
##D appID <- "xxxx"
##D appSecret <- "xxxx"
##D 
##D # Authenticate and Collect some data (and save data to disk using `writeToFile=TRUE`)
##D myFacebookData <- Authenticate("Facebook", appID = appID, appSecret = appSecret) %>%
##D    Collect(pageName="StarWars", rangeFrom="2015-03-01",
##D      rangeTo="2015-03-02", writeToFile=TRUE)
##D 
##D # Import the data (that was saved to disk in the previous step)
##D myStarWarsData <- importData("2015-03-01_to_2015-03-02_StarWars_FacebookData.csv","facebook")
##D 
##D # Create a network using the imported dataframe object
##D myNetwork <- myStarWarsData %>% Create("Bimodal")
## End(Not run)



