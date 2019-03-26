library(SIBERG)


### Name: fitNL
### Title: Fit Negative Binomial Mixture Model
### Aliases: fitNL

### ** Examples

# artificial microarray data from normal distribution
set.seed(1000)
dat <- rnorm(100, mean=5, sd=1)
fitNL(y=dat)



