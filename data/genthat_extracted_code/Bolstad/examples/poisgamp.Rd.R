library(Bolstad)


### Name: poisgamp
### Title: Poisson sampling with a gamma prior
### Aliases: poisgamp
### Keywords: misc

### ** Examples


## simplest call with an observation of 4 and a gamma(1, 1), i.e. an exponential prior on the
## mu
poisgamp(4, 1, 1)

##  Same as the previous example but a gamma(10, ) prior
poisgamp(4, 10, 1)

##  Same as the previous example but an improper gamma(1, ) prior
poisgamp(4, 1, 0)

## A random sample of 50 observations from a Poisson distribution with
## parameter mu = 3 and  gamma(6,3) prior
set.seed(123)
y = rpois(50,3)
poisgamp(y,6,3)

## In this example we have a random sample from a Poisson distribution
## with an unknown mean. We will use a gamma(6,3) prior to obtain the
## posterior gamma distribution, and use the R function qgamma to get a
## 95% credible interval for mu
y = c(3,4,4,3,3,4,2,3,1,7)
results = poisgamp(y,6,3)
ci = qgamma(c(0.025,0.975),results$shape, results$rate)
cat(paste("95% credible interval for mu: [",round(ci[1],3), ",", round(ci[2],3)),"]\n")

## In this example we have a random sample from a Poisson distribution
## with an unknown mean. We will use a gamma(6,3) prior to obtain the
## posterior gamma distribution, and use the R function qgamma to get a
## 95% credible interval for mu
y = c(3,4,4,3,3,4,2,3,1,7)
results = poisgamp(y, 6, 3)
ci = quantile(results, c(0.025, 0.975))
cat(paste("95% credible interval for mu: [",round(ci[1],3), ",", round(ci[2],3)),"]\n")





