library(xpose4)


### Name: ipred.vs.idv
### Title: Individual predictions (IPRED) plotted against the independent
###   variable (IDV) for Xpose 4
### Aliases: ipred.vs.idv
### Keywords: methods

### ** Examples

## Here we load the example xpose database 
xpdb <- simpraz.xpdb

ipred.vs.idv(xpdb)

## A conditioning plot
ipred.vs.idv(xpdb, by="HCTZ")

## Logarithmic Y-axis
ipred.vs.idv(xpdb, logy=TRUE)

## Custom colours and symbols, IDs
ipred.vs.idv(xpdb, cex=0.6, pch=3, col=1, ids=TRUE)




