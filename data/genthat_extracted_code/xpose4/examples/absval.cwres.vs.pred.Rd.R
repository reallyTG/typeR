library(xpose4)


### Name: absval.cwres.vs.pred
### Title: Absolute population conditional weighted residuals vs population
###   predictions for Xpose 4
### Aliases: absval.cwres.vs.pred
### Keywords: methods

### ** Examples


## Not run: 
##D ## We expect to find the required NONMEM run and table files for run
##D ## 5 in the current working directory
##D xpdb5 <- xpose.data(5)
## End(Not run)

## Here we load the example xpose database 
data(simpraz.xpdb)
xpdb <- simpraz.xpdb

## A vanilla plot
absval.cwres.vs.pred(xpdb)

## A conditioning plot
absval.cwres.vs.pred(xpdb, by="HCTZ")

## Custom heading and axis labels
absval.cwres.vs.pred(xpdb, main="My conditioning plot", ylb="|CWRES|", xlb="PRED")

## Custom colours and symbols, no IDs
absval.cwres.vs.pred(xpdb, cex=0.6, pch=3, col=1, ids=FALSE)





