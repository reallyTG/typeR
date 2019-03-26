library(xpose4)


### Name: wres.vs.idv
### Title: Population weighted residuals (WRES) plotted against the
###   independent variable (IDV) for Xpose 4
### Aliases: wres.vs.idv

### ** Examples


## Here we load the example xpose database 
xpdb <- simpraz.xpdb

wres.vs.idv(xpdb)

## A conditioning plot
wres.vs.idv(xpdb, by="HCTZ")




