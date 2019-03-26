library(growthrates)


### Name: fit_growthmodel
### Title: Fit Nonlinear Parametric Growth Model
### Aliases: fit_growthmodel

### ** Examples


data(bactgrowth)
splitted.data <- multisplit(bactgrowth, c("strain", "conc", "replicate"))

## get one element either by index or by name
dat <- splitted.data[[1]]
dat <- splitted.data[["D:0:1"]]

p <- c(y0 = 0.01, mumax = 0.2, K = 0.1)

## unconstraied fitting
fit1 <- fit_growthmodel(FUN = grow_logistic, p = p, dat$time, dat$value)
coef(fit1)
summary(fit1)

## optional box-constraints
lower <- c(y0 = 1e-6, mumax = 0,   K = 0)
upper <- c(y0 = 0.05, mumax = 5,   K = 0.5)
fit1 <- fit_growthmodel(
  FUN = grow_logistic, p = p, dat$time, dat$value,
  lower = lower, upper = upper)

plot(fit1, log="y")




