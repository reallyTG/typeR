library(PearsonDS)


### Name: Pearson
### Title: The Pearson Distribution System
### Aliases: dpearson ppearson qpearson rpearson
### Keywords: distribution

### ** Examples

## Define moments of distribution
moments <- c(mean=1,variance=2,skewness=1,kurtosis=5)
## Generate some random variates
rpearson(5,moments=moments)
## evaluate distribution function
ppearson(seq(-2,3,by=1),moments=moments)
## evaluate density function
dpearson(seq(-2,3,by=1),moments=moments)
## evaluate quantile function
qpearson(seq(0.1,0.9,by=0.2),moments=moments)



