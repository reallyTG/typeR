library(BinNonNor)


### Name: validation.skewness.kurtosis
### Title: Validates the marginal specification of the continuous
###   non-normal variables
### Aliases: validation.skewness.kurtosis

### ** Examples

n.NN<-3
skewness.vec=c(0,2,3)
kurtosis.vec=c(-1.2,6,8)
validation.skewness.kurtosis(n.NN,skewness.vec,kurtosis.vec)

## Not run: 
##D n.NN<--1
##D skewness.vec=c(0)
##D kurtosis.vec=c(-1.2)
##D validation.skewness.kurtosis(n.NN,skewness.vec,kurtosis.vec)
##D 
##D n.NN<-3
##D skewness.vec=c(0,2,3)
##D kurtosis.vec=c(-1.2,6,5)
##D validation.skewness.kurtosis(3)
##D 
##D n.NN<-3
##D skewness.vec=c(0,2,3)
##D kurtosis.vec=c(-1.2,6,5)
##D validation.skewness.kurtosis(n.NN,skewness.vec)
##D validation.skewness.kurtosis(n.NN,kurtosis.vec)
##D 
##D n.NN<-0
##D skewness.vec=c(0,2,3)
##D kurtosis.vec=c(-1.2,6,8)
##D validation.skewness.kurtosis(n.NN,skewness.vec,kurtosis.vec)
##D 
##D n.NN<-2
##D skewness.vec=c(0,2,3)
##D kurtosis.vec=c(-1.2,6,8)
##D validation.skewness.kurtosis(n.NN,skewness.vec,kurtosis.vec)
##D 
##D n.NN<-2
##D skewness.vec=c(0,2,3)
##D kurtosis.vec=c(-1.2,6)
##D validation.skewness.kurtosis(n.NN,skewness.vec,kurtosis.vec)
##D 
##D skewness.vec=c(2,3)
##D kurtosis.vec=c(1,5)
##D validation.skewness.kurtosis(n.NN,skewness.vec,kurtosis.vec)
## End(Not run)



