library(xpose4)


### Name: absval.iwres.cwres.vs.ipred.pred
### Title: Absolute population weighted residuals vs population
###   predictions, and absolute individual weighted residuals vs individual
###   predictions, for Xpose 4
### Aliases: absval.iwres.cwres.vs.ipred.pred
###   absval.iwres.wres.vs.ipred.pred absval.iwres.wres.vs.ipred.pred

### ** Examples


## Here we load the example xpose database 
xpdb <- simpraz.xpdb

## A vanilla plot
absval.iwres.wres.vs.ipred.pred(xpdb)
absval.iwres.cwres.vs.ipred.pred(xpdb)

## Custom colours and symbols
absval.iwres.cwres.vs.ipred.pred(xpdb, cex=0.6, pch=8, col=1)




