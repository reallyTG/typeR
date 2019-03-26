library(xpose4)


### Name: cwres.vs.idv
### Title: Population conditional weighted residuals (CWRES) plotted
###   against the independent variable (IDV) for Xpose 4
### Aliases: cwres.vs.idv
### Keywords: methods

### ** Examples

## Here we load the example xpose database 
xpdb <- simpraz.xpdb

## A vanilla plot
cwres.vs.idv(xpdb)

## A conditioning plot
cwres.vs.idv(xpdb, by="HCTZ")




