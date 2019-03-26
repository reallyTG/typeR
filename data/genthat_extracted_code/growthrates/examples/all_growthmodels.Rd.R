library(growthrates)


### Name: all_growthmodels
### Title: Fit Nonlinear Growth Models to Data Frame
### Aliases: all_growthmodels all_growthmodels.formula
###   all_growthmodels.function

### ** Examples


data(bactgrowth)
splitted.data <- multisplit(value ~ time | strain + conc + replicate,
                 data = bactgrowth)

## show which experiments are in splitted.data
names(splitted.data)

## get table from single experiment
dat <- splitted.data[["D:0:1"]]

fit0 <- fit_spline(dat$time, dat$value)

fit1 <- all_splines(value ~ time | strain + conc + replicate,
                 data = bactgrowth, spar = 0.5)

## No test: 
## these examples require some CPU power and may take a bit longer

## initial parameters
p <- c(coef(fit0), K = max(dat$value))

## avoid negative parameters
lower = c(y0 = 0, mumax = 0, K = 0)

## fit all models
fit2 <- all_growthmodels(value ~ time | strain + conc + replicate,
          data = bactgrowth, FUN=grow_logistic,
          p = p, lower = lower, ncores = 2)

results1 <- results(fit1)
results2 <- results(fit2)
plot(results1$mumax, results2$mumax, xlab="smooth splines", ylab="logistic")

## experimental: nonlinear model as part of the formula

fit3 <- all_growthmodels(
          value ~ grow_logistic(time, parms) | strain + conc + replicate,
          data = bactgrowth, p = p, lower = lower, ncores = 2)

## this allows also to fit to the 'global' data set or any subsets
fit4 <- all_growthmodels(
          value ~ grow_logistic(time, parms),
          data = bactgrowth, p = p, lower = lower, ncores = 1)
plot(fit4)

fit5 <- all_growthmodels(
          value ~ grow_logistic(time, parms) | strain + conc,
          data = bactgrowth, p = p, lower = lower, ncores = 2)
plot(fit5)
## End(No test)




