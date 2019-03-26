library(gratia)


### Name: qq_plot
### Title: Quantile-quantile plot of model residuals
### Aliases: qq_plot qq_plot.gam

### ** Examples

library("mgcv")
## simulate binomial data...
set.seed(0)
n.samp <- 200
dat <- gamSim(1, n = n.samp, dist = "binary", scale = .33)
p <- binomial()$linkinv(dat$f)               # binomial p
n <- sample(c(1, 3), n.samp, replace = TRUE) # binomial n
dat <- transform(dat, y = rbinom(n, n, p), n = n)
m <- gam( y / n ~ s(x0) + s(x1) + s(x2) + s(x3),
         family = binomial, data = dat, weights = n,
         method = "REML")

## Q-Q plot; default using direct randomization of uniform quantiles
qq_plot(m)

## Alternatively use simulate new data from the model, which
## allows construction of reference intervals for the Q-Q plot
qq_plot(m, method = "simulate")

## ... or use the usual normality assumption
qq_plot(m, method = "normal")



