library(yorkr)


### Name: teamBowlersVsBatsmenAllOppnAllMatchesMain
### Title: Compute team bowlers vs batsmen all opposition all matches
### Aliases: teamBowlersVsBatsmenAllOppnAllMatchesMain

### ** Examples

## Not run: 
##D # Get all matches between India and all oppostions
##D matches <-getAllMatchesAllOpposition("India",dir="../data/",save=TRUE)
##D 
##D # You could also load directly from the saved file
##D #load("allMatchesAllOpposition-India.RData")
##D # The call below gives the best bowlers of India
##D teamBowlersVsBatsmenAllOppnAllMatchesMain(matches,theTeam="India",rank=0)
##D 
##D # The call with rank=1 gives the performance of the 'India' bowler with rank=1
##D  teamBowlersVsBatsmenAllOppnAllMatchesMain(matches,theTeam="India",rank=1)
## End(Not run)




