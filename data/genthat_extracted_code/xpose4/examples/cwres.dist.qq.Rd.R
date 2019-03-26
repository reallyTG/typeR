library(xpose4)


### Name: cwres.dist.qq
### Title: Quantile-quantile plot of conditional weighted residuals
###   (CWRES), for Xpose 4
### Aliases: cwres.dist.qq
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
cwres.dist.qq(xpdb)

## A different plotting character
cwres.dist.qq(xpdb, pch=4)





