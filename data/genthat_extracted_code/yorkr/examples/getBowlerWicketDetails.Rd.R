library(yorkr)


### Name: getBowlerWicketDetails
### Title: Get the bowling details of a bowler
### Aliases: getBowlerWicketDetails

### ** Examples

## Not run: 
##D # Get the bowling details of bowlers of a team e.g. India. This is saved as a dataframe
##D c <- getTeamBowlingDetails("India",dir="../data",save=TRUE)
##D #Get the bowler details from this overall data frame
##D 
##D jadeja <- getBowlerWicketDetails(team="India",name="Jadeja",dir=".")
##D 
##D # The dataframe from the above call is used in many functions
##D #bowlerMeanEconomyRate(jadeja,"RA Jadeja")
## End(Not run)




