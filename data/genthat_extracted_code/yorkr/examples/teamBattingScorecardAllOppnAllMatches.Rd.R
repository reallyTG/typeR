library(yorkr)


### Name: teamBattingScorecardAllOppnAllMatches
### Title: Team batting scorecard against all oppositions in all matches
### Aliases: teamBattingScorecardAllOppnAllMatches

### ** Examples

## Not run: 
##D # Get all matches between India with all oppositions
##D matches <-getAllMatchesAllOpposition("India",dir="../data/",save=TRUE)
##D 
##D # This can also be loaded from saved file
##D # load("allMatchesAllOpposition-India.RData")
##D 
##D # Top batsman is displayed in descending order of runs
##D teamBattingScorecardAllOppnAllMatches(matches,theTeam="India")
##D 
##D # The best England players scorecard against India is shown
##D teamBattingScorecardAllOppnAllMatches(matches,theTeam="England")
## End(Not run)




