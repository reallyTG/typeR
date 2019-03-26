library(yorkr)


### Name: teamBowlersVsBatsmenAllOppnAllMatchesRept
### Title: report of Team bowlers vs batsmen against all opposition all
###   matches
### Aliases: teamBowlersVsBatsmenAllOppnAllMatchesRept

### ** Examples

## Not run: 
##D # Get all matches between India and all oppostions
##D matches <-getAllMatchesAllOpposition("India",dir="../data/",save=TRUE)
##D 
##D # You could also load directly from the saved file
##D #load("allMatchesAllOpposition-India.RData")
##D # The call below gives the best bowlers against India
##D teamBowlersVsBatsmenAllOppnAllMatchesRept(matches,theTeam="India",rank=0)
##D 
##D # The call with rank=1 gives the performace of the bowler with rank
##D  teamBowlersVsBatsmenAllOppnAllMatchesRept(matches,theTeam="India",rank=1)
##D 
##D # The call below gives the overall performance of India bowlers against South Africa
##D  teamBatsmenVsBowlersAllOppnAllMatchesRept(matches,"South Africa",rank=0)
##D 
##D # The call below gives the performance of best Indias bowlers against Australia
##D teamBowlersVsBatsmenAllOppnAllMatchesRept(matches,"Australia",rank=1)
## End(Not run)




