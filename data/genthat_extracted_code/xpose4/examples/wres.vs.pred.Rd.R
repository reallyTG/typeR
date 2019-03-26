library(xpose4)


### Name: wres.vs.pred
### Title: Population weighted residuals (WRES) plotted against population
###   predictions (PRED) for Xpose 4
### Aliases: wres.vs.pred
### Keywords: methods

### ** Examples

## Here we load the example xpose database 
xpdb <- simpraz.xpdb

wres.vs.pred(xpdb)

## A conditioning plot
wres.vs.pred(xpdb, by="HCTZ")




