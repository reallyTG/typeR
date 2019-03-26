library(xpose4)


### Name: autocorr.wres
### Title: Autocorrelation of weighted residuals for Xpose 4
### Aliases: autocorr.wres
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
autocorr.wres(xpdb)

## A conditioning plot
autocorr.wres(xpdb, dilution=TRUE)

## Custom heading and axis labels
autocorr.wres(xpdb, main="My conditioning plot", ylb="|CWRES|", xlb="PRED")

## Custom colours and symbols, IDs
autocorr.wres(xpdb, cex=0.6, pch=3, col=1, ids=TRUE)

## A vanilla plot with IWRES
autocorr.iwres(xpdb)




