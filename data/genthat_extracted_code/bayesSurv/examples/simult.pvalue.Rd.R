library(bayesSurv)


### Name: simult.pvalue
### Title: Compute a simultaneous p-value from a sample for a vector valued
###   parameter.
### Aliases: simult.pvalue print.simult.pvalue
### Keywords: htest

### ** Examples

m <- 1000
sample <- data.frame(x1=rnorm(m), x2=rnorm(m), x3=rnorm(m))
simult.pvalue(sample)

sample <- data.frame(x1=rnorm(m), x2=rnorm(m), x3=rnorm(m, mean=2))
simult.pvalue(sample)

sample <- data.frame(x1=rnorm(m), x2=rnorm(m), x3=rnorm(m, mean=5))
simult.pvalue(sample, prob=0.99, precision=0.0001)



