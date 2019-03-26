library(xpose4)


### Name: iwres.vs.idv
### Title: Individual weighted residuals (IWRES) plotted against the
###   independent variable (IDV) for Xpose 4
### Aliases: iwres.vs.idv
### Keywords: methods

### ** Examples

## Here we load the example xpose database 
xpdb <- simpraz.xpdb

iwres.vs.idv(xpdb)

## A conditioning plot
iwres.vs.idv(xpdb, by="HCTZ")




