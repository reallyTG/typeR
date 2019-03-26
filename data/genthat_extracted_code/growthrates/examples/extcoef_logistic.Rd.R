library(growthrates)


### Name: extcoef_logistic
### Title: Extended Set of Coefficients of a Logistic Growth Model
### Aliases: extcoef_logistic

### ** Examples


## =========================================================================
## The 'extended parameters' are usually derived
## =========================================================================

data(antibiotic)

## fit a logistic model to a single data set
dat <- subset(antibiotic, conc==0.078 & repl=="R4")

parms <- c(y0=0.01, mumax=0.2, K=0.5)
fit <- fit_growthmodel(grow_logistic, parms, dat$time, dat$value)
coef(fit, extended=TRUE)

## fit the logistic to all data sets
myData <- subset(antibiotic, repl=="R3")
parms <- c(y0=0.01, mumax=0.2, K=0.5)
all <- all_growthmodels(value ~ time | conc,
                         data = myData, FUN=grow_logistic,
                         p = parms, ncores = 2)


par(mfrow=c(3,4))
plot(all)
results(all, extended=TRUE)
## we see that the the last 3 series (10...12) do not go into saturation
## within the observation time period.

## We can try to extend the search range:
results(all[10:12], extended=TRUE, time=c(0, 5000))


## =========================================================================
## visualisation how the 'extended parameters' are derived
## =========================================================================

# Derivatives of the logistic:
#   The 1st and 2nd derivatives are internal functions of the package.
#   They are used here for the visualisation of the algorithm.

deriv1 <- function(time, y0, mumax, K) {
  ret <- (K*mumax*y0*(K - y0)*exp(mumax * time))/
    ((K + y0 * (exp(mumax * time) - 1))^2)
  unname(ret)
}

deriv2 <- function(time, y0, mumax, K) {
  ret <- -(K * mumax^2 * y0 * (K - y0) * exp(mumax * time) *
             (-K + y0 * exp(mumax * time) + y0))/
    (K + y0 * (exp(mumax * time) - 1))^3
  unname(ret)
}
## =========================================================================

data(bactgrowth)
## extract one growth experiment by name
dat <- multisplit(bactgrowth, c("strain", "conc", "replicate"))[["D:0:1"]]


## unconstraied fitting
p <- c(y0 = 0.01, mumax = 0.2, K = 0.1) # start parameters
fit1 <- fit_growthmodel(FUN = grow_logistic, p = p, dat$time, dat$value)
summary(fit1)
p <- coef(fit1, extended=TRUE)

## copy parameters to separate variables to improve readability ------------
y0 <-    p["y0"]
mumax <- p["mumax"]
K  <-    p["K"]
turnpoint <- p["turnpoint"]
sat1 <-  p["sat1"]  # 2nd derivative
sat2 <-  p["sat2"]  # intercept between steepest increase and K
sat3 <-  p["sat3"]  # a given quantile of K, default 95%

## show saturation values in growth curve and 1st and 2nd derivatives ------
opar <- par(no.readonly=TRUE)
par(mfrow=c(3, 1), mar=c(4,4,0.2,0))
plot(fit1)

## 95% saturation
abline(h=0.95*K, col="magenta", lty="dashed")

## Intercept between steepest increase and 100% saturation
b <- deriv1(turnpoint, y0, mumax, K)
a <- K/2 - b*turnpoint
abline(a=a, b=b, col="orange", lty="dashed")
abline(h=K, col="orange", lty="dashed")
points(sat2, K, pch=16, col="orange")
points(turnpoint, K/2, pch=16, col="blue")

## sat2 is the minimum of the 2nd derivative
abline(v=c(turnpoint, sat1, sat2, sat3),
       col=c("blue", "grey", "orange", "magenta"), lty="dashed")

## plot the derivatives
with(dat, plot(time, deriv1(time, y0, mumax, K), type="l", ylab="y'"))
abline(v=c(turnpoint, sat1), col=c("blue", "grey"), lty="dashed")

with(dat, plot(time, deriv2(time, y0, mumax, K), type="l",  ylab="y''"))
abline(v=sat1, col="grey", lty="dashed")
par(opar)




