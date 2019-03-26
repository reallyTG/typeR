library(xpose4)


### Name: absval.wres.vs.pred
### Title: Absolute population weighted residuals vs population predictions
###   for Xpose 4
### Aliases: absval.wres.vs.pred
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
absval.wres.vs.pred(xpdb)

## A conditioning plot
absval.wres.vs.pred(xpdb, by="HCTZ")

## Custom heading and axis labels
absval.wres.vs.pred(xpdb, main="My conditioning plot", 
  ylb="|WRES|", xlb="PRED")

## Custom colours and symbols
absval.wres.vs.pred(xpdb, cex=0.6, pch=19, col=1, 
  smcol="blue", smlty=2)




