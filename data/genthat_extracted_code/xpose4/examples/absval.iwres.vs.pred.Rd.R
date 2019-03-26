library(xpose4)


### Name: absval.iwres.vs.pred
### Title: Absolute individual weighted residuals vs population predictions
###   or independent variable for Xpose 4
### Aliases: absval.iwres.vs.pred
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
absval.iwres.vs.pred(xpdb)

## A conditioning plot
absval.iwres.vs.pred(xpdb, by="HCTZ")

## Custom heading and axis labels
absval.iwres.vs.pred(xpdb, main="My conditioning plot", ylb="|IWRES|", xlb="PRED")

## Custom colours and symbols, no IDs
absval.iwres.vs.pred(xpdb, cex=0.6, pch=3, col=1, ids=FALSE)






