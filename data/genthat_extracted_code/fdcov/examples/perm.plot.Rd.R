library(fdcov)


### Name: perm.plot
### Title: Plot partial p-values
### Aliases: perm.plot

### ** Examples

## Not run: 
##D ## Phoneme data
##D 
##D library(fdcov)
##D library(fds)
##D 
##D # Create data set
##D data(aa); data(ao); data(dcl);data(iy);data(sh)
##D dat=cbind(aa$y[,1:20],ao$y[,1:20],dcl$y[,1:20],iy$y[,1:20],sh$y[,1:20])
##D dat=t(dat)
##D grp=c(rep(1,20),rep(2,20),rep(3,20),rep(4,20),rep(5,20))
##D 
##D # Test the equality of the covariance operators
##D p=ksample.perm(dat,grp,iter=100,only.glob=FALSE)
##D 
##D # Plot partial p-values
##D perm.plot(p,5, lab=c('aa','ao','dcl','iy','sh'))
## End(Not run)




