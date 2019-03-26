library(simPop)


### Name: sampHH
### Title: Sample households from given microdata.
### Aliases: sampHH
### Keywords: manip

### ** Examples

data(eusilcP)
pop <- eusilcP
colnames(pop)[3] <- "hhsize"

system.time(x1 <- sampHH(pop, strata="region", hsize="hhsize"))
dim(x1)
## Not run: 
##D ## approx. 10 second computation time ...
##D system.time(x1 <- sampHH(pop, sizefactor=4, strata="region", hsize="hhsize"))
##D dim(x1)
##D system.time(x2 <- sampHH(pop, strata=NULL, hsize="hhsize"))
##D 
##D pop <- pop[,-which(colnames(pop)=="hhsize")]
##D system.time(y1 <- sampHH(pop, strata="region", hsize=NULL))
##D system.time(y2 <- sampHH(pop, strata=NULL, hsize=NULL))
## End(Not run)



