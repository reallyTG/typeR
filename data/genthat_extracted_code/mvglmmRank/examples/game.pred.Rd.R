library(mvglmmRank)


### Name: game.pred
### Title: Predict outcomes of games.
### Aliases: game.pred
### Keywords: regression

### ** Examples

data(nfl2012)
mvglmmRank(nfl2012,method="PB0",first.order=TRUE,verbose=TRUE,max.iter.EM=1)
## No test: 
result <- mvglmmRank(nfl2012,method="PB0",first.order=TRUE,verbose=TRUE)
print(result)
game.pred(result,home="Denver Broncos",away="Green Bay Packers")
## End(No test)



