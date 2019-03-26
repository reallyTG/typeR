library(yorkr)


### Name: teamBowlersVsBatsmenAllOppnAllMatchesPlot
### Title: Plot bowlers vs batsmen against all opposition all matches
### Aliases: teamBowlersVsBatsmenAllOppnAllMatchesPlot

### ** Examples

## Not run: 
##D # Get all matches between India and all oppostions
##D matches <-getAllMatchesAllOpposition("India",dir="../data/",save=TRUE)
##D 
##D #Get the details of the bowler with the specified rank as a dataframe
##D df <- teamBowlersVsBatsmenAllOppnAllMatchesRept(matches,theTeam="India",rank=1)
##D #Plot this
##D teamBowlersVsBatsmenAllOppnAllMatchesPlot(df,"India","India")
##D 
##D df <- teamBowlersVsBatsmenAllOppnAllMatchesRept(matches,theTeam="England",rank=1)
##D teamBowlersVsBatsmenAllOppnAllMatchesPlot(df,"India","England")
## End(Not run)




