library(rmutil)


### Name: gettvc
### Title: Find the Most Recent Value of a Time-varying Covariate Before
###   Each Observed Response
### Aliases: gettvc
### Keywords: manip

### ** Examples

## Not run: 
##D y <- matrix(rnorm(20), ncol=5)
##D resp <- restovec(y, times=c(1,3,6,10,15))
##D z <- matrix(rpois(20,5),ncol=5)
##D z
##D # create a new time-varying covariate object for the response
##D newtvc <- gettvc(resp, tvcov=z, tvctimes=c(1,2,5,12,14))
##D covariates(newtvc)
##D # add another time-varying covariate to the object
##D z2 <- matrix(rpois(20,5),ncol=5)
##D z2
##D newtvc2 <- gettvc(resp, tvcov=z2, tvctimes=c(0,4,5,12,16), oldtvc=newtvc)
##D covariates(newtvc2)
## End(Not run)



