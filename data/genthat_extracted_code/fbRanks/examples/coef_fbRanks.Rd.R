library(fbRanks)


### Name: coef.fbRanks
### Title: Return Coefficients from fbRanks Objects
### Aliases: coef coef.fbRanks

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
##D #there are multiple clusters
##D names(coef(x)$coef.list)
##D 
##D #show the coefficients for cluster 1 as a list
##D #notice that fewer goals are scored on Turf
##D coef(x)$coef.list[[1]]
## End(Not run)



