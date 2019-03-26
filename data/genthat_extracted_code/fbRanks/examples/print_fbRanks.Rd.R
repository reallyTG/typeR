library(fbRanks)


### Name: print.fbRanks
### Title: Printing function for fbRanks Objects
### Aliases: print print.fbRanks

### ** Examples
 
#This loads two data frames: B00.scores and B00.teams
data(B00data)
#rank the teams in the RCL D1 league
x=rank.teams(scores=B00.scores, teams=B00.teams, venue="RCL D1")

#Just a printing of the ranks with no extra info shown.
#some 2 team clusters are shown.  Those are teams with just 1 game (against each other)
print(x)

## Not run: 
##D #rank all teams
##D x=rank.teams(scores=B00.scores, teams=B00.teams, venue="RCL D1")
##D 
##D #You can also do filtered prints
##D #print the ranks with the regions shown
##D print(x, region="all")
##D 
##D #print ranks for just a region
##D print(x, region="WA")
##D 
##D #print ranks for a league; fall.league is a column in the teams data frame
##D print(x, fall.league=c("RCL D1 U12","RCL D2 U12"))
##D 
##D #print ranks for teams in a tournament; venue is a column in the scores data frame
##D print(x, venue="Baker Blast")
## End(Not run)



