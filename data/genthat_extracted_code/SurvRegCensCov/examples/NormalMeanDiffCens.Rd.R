library(SurvRegCensCov)


### Name: NormalMeanDiffCens
### Title: Maximum Likelihood Estimator for the mean difference between two
###   censored normally distributed samples
### Aliases: NormalMeanDiffCens
### Keywords: methods

### ** Examples

## example with interval-censored Normal samples
n <- 500
prop.cens <- 0.35
mu <- c(0, 2)
sigma <- c(1, 1)

set.seed(2013)

## Sample 1:
LOD1 <- qnorm(prop.cens, mean = mu[1], sd = sigma[1])
x1 <- rnorm(n, mean = mu[1], sd = sigma[1])
s1 <- censorContVar(x1, LLOD = LOD1)

## Sample 2:
LOD2 <- qnorm(0.35, mean = mu[2], sd = sigma[2])
x2 <- rnorm(n, mean = mu[2], sd = sigma[2])
s2 <- censorContVar(x2, LLOD = LOD2)

## inference on distribution parameters and mean difference:
NormalMeanDiffCens(censdata1 = s1, censdata2 = s2)



