library(xpose4)


### Name: compute.cwres
### Title: Compute the Conditional Weighted Residuals
### Aliases: compute.cwres ind.cwres read.cwres.data is.cwres.readable.file
###   sqrtm xpose.calculate.cwres xpose.calculate.cwres
### Keywords: methods

### ** Examples


## Not run: 
##D ## Capture CWRES from cwtab5.est and cwtab5.deriv
##D cwres <- compute.cwres(5)
##D mean(cwres)
##D var(cwres)
##D 
##D ## Capture CWRES from cwtab1.est and cwtab1.deriv, do not print out, allow zeroes
##D cwres <- compute.cwres("1", printToOutFile = FALSE,
##D   onlyNonZero = FALSE)
##D 
##D ## Capture CWRES for ID==1
##D cwres.1 <- compute.cwres("1", id=1)
##D 
##D ## xpdb5 is an Xpose data object
##D ## We expect to find the required NONMEM run and table files for run
##D ## 5 in the current working directory
##D xpdb5 <- xpose.data(5)
##D 
##D ## Compare WRES, CWRES
##D xpdb5 <- xpose.calculate.cwres(xpdb5)
##D cwres.wres.vs.idv(xpdb5) 
##D 
## End(Not run)




