library(fbRanks)


### Name: residuals.fbRanks
### Title: Residuals function for fbRanks Objects
### Aliases: residuals residuals.fbRanks

### ** Examples
 

data(B00data) #load a set of games
#fit a model using just the matches from the RCL D1 league
x=rank.teams(scores=B00.scores, teams=B00.teams, venue="RCL D1")

#Show the predicted versus actual scores
b00.resids=residuals(x)

## Not run: 
##D #you can compare to the residuals for a model to fit to all the data (including RCL D1)
##D x=rank.teams(scores=B00.scores, teams=B00.teams)
##D 
##D #Just a printing of the ranks with no extra info shown.
##D b00.resids=residuals(x, venue="RCL D1")
## End(Not run)



