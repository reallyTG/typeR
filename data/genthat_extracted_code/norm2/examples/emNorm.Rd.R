library(norm2)


### Name: emNorm
### Title: EM algorithm for incomplete multivariate normal data
### Aliases: emNorm emNorm.default emNorm.formula emNorm.norm
### Keywords: multivariate NA

### ** Examples

## run EM for marijuana data with strict convergence criterion
data(marijuana)
result <- emNorm(marijuana, criterion=1e-06)

## re-run with ridge prior and examine results
result <- emNorm(marijuana, prior="ridge", prior.df=0.5)
summary(result)



