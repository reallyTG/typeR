library(fbRanks)


### Name: predict.fbRanks
### Title: Predict function for fbRanks Objects
### Aliases: predict predict.fbRanks

### ** Examples

## Not run: 
##D #This will load two dataframes: B00.scores and B00.teams
##D data(B00data)
##D 
##D #fit a model using a particular date range for B00 teams
##D #set the data range to just be the summer games of WA teams
##D x=rank.teams(scores=B00.scores, teams=B00.teams, 
##D              min.date="2012-5-1", max.date="2012-9-8", silent=TRUE)
##D 
##D #x is a fbRanks object with the fitted model and ranks, and the scores and teams data.frames
##D #the scores data.frames has all the data, not just the summer data
##D 
##D #Now we can use the summer data to predict the fall RCL D1 games (top B00 league in WA)
##D predict(x, venue="RCL D1")
##D 
##D #We can also predict all the games for a particular team
##D predict(x, name="Seattle United Copa B00")
## End(Not run)



