library(xpose4)


### Name: dv.vs.idv
### Title: Observations (DV) plotted against the independent variable (IDV)
###   for Xpose 4
### Aliases: dv.vs.idv
### Keywords: methods

### ** Examples

## Here we load the example xpose database 
xpdb <- simpraz.xpdb

dv.vs.idv(xpdb)

## A conditioning plot
dv.vs.idv(xpdb, by="HCTZ")

## Logarithmic Y-axis
dv.vs.idv(xpdb, logy=TRUE)




