library(fbRanks)


### Name: simulate.fbRanks
### Title: Simulate function for fbRanks Objects
### Aliases: simulate simulate.fbRanks

### ** Examples

#When specifying filters such as age, name, or league, these must correspond to column names in the 
#scores or team files.
data(B00data) #load a set of games
#fit a model using a particular date range for B00 teams
#add predictors surface and adv (home/away advantage)
## Not run: 
##D x=rank.teams(scores=B00.scores, teams=B00.teams, min.date="2012-5-1", max.date="2012-9-8",
##D     silent=TRUE, add=c("surface","adv"))
##D 
##D #simulate a league
##D #in this case, since newdata is not passed in, simulate tries to construct
##D #newdata from x$scores using the venue information
##D simulate(x, venue="RCL D1", points.rule="league3pt")
## End(Not run)

#simulate a tournament
#B00data includes a dataframe B00.founders with the brackets for
#the preliminary rounds of the Founders B00 2012 tournament
#fit a model with all data up to the start of the Founders Cup
## Not run: 
##D x=rank.teams(scores=B00.scores, teams=B00.teams, min.date="2012-5-1", max.date="2012-12-14",
##D     silent=TRUE, add=c("surface","adv"))
##D simulate(x, newdata=B00.founders, groups.column="venue")
## End(Not run)



