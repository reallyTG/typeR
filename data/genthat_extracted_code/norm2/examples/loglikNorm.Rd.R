library(norm2)


### Name: loglikNorm
### Title: Observed-data loglikelikehood for incomplete multivariate normal
###   data
### Aliases: loglikNorm loglikNorm.default loglikNorm.formula
###   loglikNorm.norm
### Keywords: multivariate NA

### ** Examples


## run EM for cholesterol data and display the
## loglikelihood values at all iterations
data(cholesterol)
emResult <- emNorm(cholesterol)
print( emResult$loglik )

## compute the loglikelihood at the final estimate
## and compare it to the last loglikelihood value
## reported by emNorm
loglik.max <- loglikNorm(emResult)
print( loglik.max - emResult$loglik[ emResult$iter ] )

## The result from loglikNorm is slightly higher,
## because the last value reported by emNorm is the
## loglikelihood at the BEGINNING of the last iteration




