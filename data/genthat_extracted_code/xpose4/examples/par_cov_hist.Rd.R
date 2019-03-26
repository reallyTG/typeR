library(xpose4)


### Name: par_cov_hist
### Title: Plot the parameter or covariate distributions using a histogram
### Aliases: par_cov_hist cov.hist parm.hist ranpar.hist
### Keywords: methods

### ** Examples


## Here we load the example xpose database 
xpdb <- simpraz.xpdb

## Parameter histograms
parm.hist(xpdb)

## Covariate distribution, in green
cov.hist(xpdb, hicol=11, hidcol="DarkGreen", hiborder="White")

## Random parameter histograms
ranpar.hist(xpdb)




