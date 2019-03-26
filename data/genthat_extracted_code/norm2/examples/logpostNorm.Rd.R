library(norm2)


### Name: logpostNorm
### Title: Observed-data log-posterior density for incomplete multivariate
###   normal data
### Aliases: logpostNorm logpostNorm.default logpostNorm.formula
###   logpostNorm.norm
### Keywords: multivariate NA

### ** Examples


## run EM for marijuana data with ridge prior and print the
## last value of the log-posterior density
data(marijuana)
emResult <- emNorm(marijuana, prior="ridge", prior.df=0.5)
print( emResult$logpost[ emResult$iter ] )

## compute the log-posterior density at the final estimate
## and compare it to the last value reported by emNorm
logpost.max <- logpostNorm(emResult)
print( logpost.max - emResult$logpost[ emResult$iter ] )

## The result from logpostNorm is slightly higher,
## because the last value reported by emNorm is the
## log-posterior at the BEGINNING of the last iteration




