library(xpose4)


### Name: cat.pc
### Title: Categorical (visual) predictive check.
### Aliases: cat.pc
### Keywords: methods

### ** Examples


## Not run: 
##D ## read in table files
##D runno <- 45
##D xpdb <- xpose.data(runno)
##D 
##D ## create proportion (visual) predictive check
##D cat.pc(xpdb,idv=NULL)
##D cat.pc(xpdb,idv="DOSE")
##D cat.pc(xpdb,idv="DOSE",histo=F)
##D cat.pc(xpdb,idv="TIME",histo=T,level.to.plot=1)
## End(Not run)




