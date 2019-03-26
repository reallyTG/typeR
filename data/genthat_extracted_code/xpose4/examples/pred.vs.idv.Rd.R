library(xpose4)


### Name: pred.vs.idv
### Title: Population predictions (PRED) plotted against the independent
###   variable (IDV) for Xpose 4
### Aliases: pred.vs.idv
### Keywords: methods

### ** Examples

## Here we load the example xpose database 
xpdb <- simpraz.xpdb

pred.vs.idv(xpdb)

## A conditioning plot
pred.vs.idv(xpdb, by="HCTZ")

## Logarithmic Y-axis
pred.vs.idv(xpdb, logy=TRUE)

## Custom colours and symbols, IDs
pred.vs.idv(xpdb, cex=0.6, pch=3, col=1, ids=TRUE)





