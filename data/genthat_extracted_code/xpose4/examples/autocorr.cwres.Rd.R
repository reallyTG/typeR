library(xpose4)


### Name: autocorr.cwres
### Title: Autocorrelation of conditional weighted residuals for Xpose 4
### Aliases: autocorr.cwres
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
autocorr.cwres(xpdb)

## A conditioning plot
autocorr.cwres(xpdb, dilution=TRUE)

## Custom heading and axis labels
autocorr.cwres(xpdb, main="My conditioning plot", ylb="|CWRES|", xlb="PRED")

## Custom colours and symbols, IDs
autocorr.cwres(xpdb, cex=0.6, pch=3, col=1, ids=TRUE)





