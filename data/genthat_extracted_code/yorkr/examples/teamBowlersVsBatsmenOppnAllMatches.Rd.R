library(yorkr)


### Name: teamBowlersVsBatsmenOppnAllMatches
### Title: Team bowlers vs batsmen against an opposition in all matches
### Aliases: teamBowlersVsBatsmenOppnAllMatches

### ** Examples

## Not run: 
##D # Get all matches between India and Australia
##D matches <- getAllMatchesBetweenTeams("Australia","India",dir="../data")
##D 
##D #  Plot the performance of top 5 Indian bowlers against Australia
##D teamBowlersVsBatsmanOppnAllMatches(matches,'India',"Australia",top=5)
##D 
##D # Plot the performance of top 3 Australian bowlers against India
##D teamBowlersVsBatsmenOppnAllMatches(matches,"Australia","India",top=3)
##D 
##D # Get the top 5 bowlers of Australia. Do not plot but get as a dataframe
##D teamBowlersVsBatsmenOppnAllMatches(matches,"Australia","India",plot=FALSE)
## End(Not run)




