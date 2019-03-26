library(SurvRegCensCov)


### Name: ParamSampleCens
### Title: Maximum Likelihood Estimator of parameters from a censored
###   sample
### Aliases: ParamSampleCens
### Keywords: methods

### ** Examples

n <- 500
prop.cens <- 0.35

## example with a left-censored Normally distributed sample
set.seed(2013)
mu <- 3.5
sigma <- 1
LOD <- qnorm(prop.cens, mean = mu, sd = sigma)
x1 <- rnorm(n, mean = mu, sd = sigma)
s1 <- censorContVar(x1, LLOD = LOD)
ParamSampleCens(censdata = s1)


## example with an interval-censored Normal sample
set.seed(2013)
x2 <- rnorm(n, mean = mu, sd = sigma)
LOD <- qnorm(prop.cens / 2, mean = mu, sd = sigma)
UOD <- qnorm(1 - prop.cens / 2, mean = mu, sd = sigma)
s2 <- censorContVar(x2, LLOD = LOD, ULOD = UOD)
ParamSampleCens(censdata = s2)


## Not run: 
##D ## compare to fitdistrplus
##D library(fitdistrplus)
##D s2 <- as.data.frame(s2)
##D colnames(s2) <- c("left", "right")
##D summary(fitdistcens(censdata = s2, distr = "norm"))
## End(Not run)



