library(yorkr)


### Name: teamBattingScorecardOppnAllMatches
### Title: Team batting scorecard of a team in all matches against an
###   opposition
### Aliases: teamBattingScorecardOppnAllMatches

### ** Examples

## Not run: 
##D # Get all matches between India and Australia
##D matches <- getAllMatchesBetweenTeams("India","Australia",dir="../data",save=TRUE)
##D # Compute the scorecard of India in matches with australia
##D teamBattingScorecardOppnAllMatches(matches,main="India",opposition="Australia")
##D 
##D #Get all matches between Australia and India
##D matches <- getAllMatchesBetweenTeams("Australia","India",dir="../data")
##D #Compute the batting scorecard of Australia
##D teamBattingScorecardOppnAllMatches(matches,"Australia","India")
## End(Not run)




