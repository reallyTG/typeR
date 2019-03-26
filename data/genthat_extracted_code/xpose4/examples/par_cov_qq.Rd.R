library(xpose4)


### Name: par_cov_qq
### Title: Plot the parameter or covariate distributions using
###   quantile-quantile (Q-Q) plots
### Aliases: par_cov_qq cov.qq parm.qq ranpar.qq
### Keywords: methods

### ** Examples


## Here we load the example xpose database 
xpdb <- simpraz.xpdb

## parameter histograms
parm.qq(xpdb)

## A stack of random parameter histograms
ranpar.qq(xpdb)

## Covariate distribution, in green with red line of identity
cov.qq(xpdb, col=11, ablcol=2)




