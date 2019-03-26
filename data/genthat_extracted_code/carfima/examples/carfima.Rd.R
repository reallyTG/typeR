library(carfima)


### Name: carfima
### Title: Fitting a CARFIMA(p, H, q) model via frequentist or Bayesian
###   machinery
### Aliases: carfima

### ** Examples

## No test: 
##### Irregularly spaced observation time generation.

length.time <- 100
time.temp <- rexp(length.time, rate = 2)
time <- rep(NA, length.time + 1)
time[1] <- 0
for (i in 2 : (length.time + 1)) {
  time[i] <- time[i - 1] + time.temp[i - 1]
}
time <- time[-1]

##### Data genration for CARFIMA(1, H, 0) based on the observation times. 

parameter <- c(-0.4, 0.75, 0.2)
# AR parameter alpha = -0.4
# Hurst parameter = 0.75
# process uncertainty sigma = 0.2
y <- carfima.sim(parameter = parameter, time = time, ar.p = 1, ma.q = 0)  

#### Estimation 1 : MLE

res1 <- carfima(Y = y, time = time, method = "mle", ar.p = 1, ma.q = 0)

#### Estimation 2 : Bayes

res2 <- carfima(Y = y, time = time, method = "bayes", ar.p = 1, ma.q = 0, 
bayes.param.ini = parameter, bayes.param.scale = c(rep(0.2, length(parameter))),
bayes.n.warm = 100, bayes.n.sample = 1000)
## End(No test)




