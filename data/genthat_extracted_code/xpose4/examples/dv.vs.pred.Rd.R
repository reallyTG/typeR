library(xpose4)


### Name: dv.vs.pred
### Title: Observations (DV) plotted against population predictions (PRED)
###   for Xpose 4
### Aliases: dv.vs.pred
### Keywords: methods

### ** Examples

## Here we load the example xpose database 
xpdb <- simpraz.xpdb

## A vanilla plot
dv.vs.pred(xpdb)

## A conditioning plot
dv.vs.pred(xpdb, by="HCTZ")




