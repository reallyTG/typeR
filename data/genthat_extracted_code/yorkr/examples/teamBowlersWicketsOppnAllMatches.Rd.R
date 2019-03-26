library(yorkr)


### Name: teamBowlersWicketsOppnAllMatches
### Title: Team bowlers wickets against an opposition in all matches
### Aliases: teamBowlersWicketsOppnAllMatches

### ** Examples

## Not run: 
##D # Get all matches between India and Australia
##D matches <- getAllMatchesBetweenTeams("Australia","India",dir="../data")
##D 
##D #Display top 20
##D teamBowlersWicketsOppnAllMatches(matches,"India","Australia")
##D #Display and plot top 10
##D teamBowlersWicketsOppnAllMatches(matches,"Australia","India",top=10)
##D 
##D #Do not plot but return as dataframe
##D teamBowlersWicketsOppnAllMatches(matches,"India","Australia",plot=FALSE)
## End(Not run)




