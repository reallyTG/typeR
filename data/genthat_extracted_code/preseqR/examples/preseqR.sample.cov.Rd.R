library(preseqR)


### Name: preseqR.sample.cov
### Title: Predicting generalized sample coverage
### Aliases: preseqR.sample.cov
### Keywords: estimator, RFA, sample coverage

### ** Examples

## load library
library(preseqR)

## import data
data(FisherButterfly)

## construct the estimator for the sample coverage
estimator1 <- preseqR.sample.cov(FisherButterfly, r=1) 
## Given a sample that is 10 times or 20 times the size of an initial samples,
## suppose one randomly draws one more individual from the population. The
## value of the function is the probability that the representing species 
## has been observed in the sample
estimator1(c(10, 20))

## construct the estimator
estimator2 <- preseqR.sample.cov(FisherButterfly, r=2)
## the probability a species represented at least twice when the sample size
## is 50 times or 100 times of the initial sample
estimator2(c(50, 100))



