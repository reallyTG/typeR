library(fdcov)


### Name: ksample.perm
### Title: Multiple-sample permutation test for the equality of covariance
###   operators of functional data
### Aliases: ksample.perm

### ** Examples

## Not run: 
##D ## Phoneme data
##D 
##D library(fdcov)
##D library(fds)
##D 
##D # Create data set 
##D data(aa); data(ao); data(dcl);data(iy);data(sh)
##D dat = cbind(aa$y[,1:20],ao$y[,1:20],dcl$y[,1:20],iy$y[,1:20],sh$y[,1:20])
##D dat = t(dat)
##D grp = c(rep(1,20),rep(2,20),rep(3,20),rep(4,20),rep(5,20))
##D 
##D # Test the equality of the covariance operators
##D p = ksample.perm(dat, grp, iter=100, part = TRUE)
##D p$global # global p-value
##D p$partial # partial p-values
## End(Not run)
## Don't show: 
library(fdcov)
library(fds)

# Create data set 
data(aa); data(ao); data(dcl);data(iy);data(sh)
dat = cbind(aa$y[,1:20],ao$y[,1:20],dcl$y[,1:20],iy$y[,1:20],sh$y[,1:20])
dat = t(dat)
grp = c(rep(1,20),rep(2,20),rep(3,20),rep(4,20),rep(5,20))

# Test the equality of the covariance operators
p = ksample.perm(dat,grp,iter=2)
## End(Don't show)



