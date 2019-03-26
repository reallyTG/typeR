library(yorkr)


### Name: teamBatsmenVsBowlersAllOppnAllMatchesPlot
### Title: Plot of Team batsmen vs bowlers against all opposition all
###   matches
### Aliases: teamBatsmenVsBowlersAllOppnAllMatchesPlot

### ** Examples

## Not run: 
##D # Get all matches for team India against all oppositions in all matches
##D matches <-getAllMatchesAllOpposition("India",dir="../data/",save=TRUE)
##D 
##D # Also load directly from file
##D #load("allMatchesAllOpposition-India.RData")
##D 
##D d <- teamBatsmanVsBowlersAllOppnAllMatchesRept(matches,"India",rank=1,dispRows=50)
##D teamBatsmenVsBowlersAllOppnAllMatchesPlot(d)
##D e <- teamBatsmenVsBowlersAllOppnAllMatchesPlot(d,plot=FALSE)
## End(Not run)




