library(xpose4)


### Name: absval.wres.vs.idv
### Title: Absolute value of (C)WRES vs. independent variable plot in
###   Xpose4.
### Aliases: absval.wres.vs.idv
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
absval.wres.vs.idv(xpdb)

## A conditioning plot
absval.wres.vs.idv(xpdb, by="HCTZ")

## Custom heading and axis labels
absval.wres.vs.idv(xpdb, main="Hello World", ylb="|CWRES|", xlb="IDV")

## Custom colours and symbols
absval.wres.vs.idv(xpdb, cex=0.6, pch=3, col=1)

## using the NPDEs instead of CWRES
absval.wres.vs.idv(xpdb,wres="NPDE")

## subsets
absval.wres.vs.idv(xpdb,subset="TIME<10")





