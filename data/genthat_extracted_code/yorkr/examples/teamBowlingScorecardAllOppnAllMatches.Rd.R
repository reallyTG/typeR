library(yorkr)


### Name: teamBowlingScorecardAllOppnAllMatches
### Title: Team bowling scorecard all opposition all matches
### Aliases: teamBowlingScorecardAllOppnAllMatches

### ** Examples

## Not run: 
##D #Get all matches between India  and other opposition
##D matches <-getAllMatchesAllOpposition("India",dir="../data/",save=TRUE)
##D 
##D # Or load directly from saved file
##D # load("allMatchesAllOpposition-India.RData")
##D 
##D # Top opposition bowlers performances against India
##D teamBowlingScorecardAllOppnAllMatches(matches,"India")
##D 
##D #Top Indian bowlers against respective opposition
##D teamBowlingScorecardAllOppnAllMatches(matches,'Australia')
##D teamBowlingScorecardAllOppnAllMatches(matches,'South Africa')
##D teamBowlingScorecardAllOppnAllMatches(matches,'England')
## End(Not run)




