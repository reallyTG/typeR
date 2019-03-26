library(xpose4)


### Name: cwres.vs.pred
### Title: Population conditional weighted residuals (CWRES) plotted
###   against population predictions (PRED) for Xpose 4
### Aliases: cwres.vs.pred
### Keywords: methods

### ** Examples

## Here we load the example xpose database 
xpdb <- simpraz.xpdb

cwres.vs.pred(xpdb)

## A conditioning plot
cwres.vs.pred(xpdb, by="HCTZ")




