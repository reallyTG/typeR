library(ESGtoolkit)


### Name: esgplotbands
### Title: Plot time series percentiles and confidence intervals
### Aliases: esgplotbands

### ** Examples

# Times series

kappa <- 1.5
V0 <- theta <- 0.04
sigma <- 0.2
theta1 <- kappa*theta
theta2 <- kappa
theta3 <- sigma
x <- simdiff(n = 100, horizon = 5,
frequency = "quart",
model = "OU",
x0 = V0, theta1 = theta1, theta2 = theta2, theta3 = theta3)

par(mfrow=c(2,1))
esgplotbands(x, xlab = "time", ylab = "values")
matplot(time(x), x, type = 'l', xlab = "time", ylab = "series values")

# Martingale test

r0 <- 0.03
S0 <- 100
sigma0 <- 0.1
nbScenarios <- 100
horizon0 <- 10
eps0 <- simshocks(n = nbScenarios, horizon = horizon0, frequency = "quart",
method = "anti")
sim.GBM <- simdiff(n = nbScenarios, horizon = horizon0, frequency = "quart",
                 model = "GBM",
                 x0 = S0, theta1 = r0, theta2 = sigma0,
                 eps = eps0)

mc.test <- esgmartingaletest(r = r0, X = sim.GBM, p0 = S0, alpha = 0.05)
esgplotbands(mc.test)

# Correlation test

nb <- 500

s0.par1 <- simshocks(n = nb, horizon = 3, frequency = "semi",
family = 1, par = 0.2)

s0.par2 <- simshocks(n = nb, horizon = 3, frequency = "semi",
family = 1, par = 0.8)

(test1 <- esgcortest(s0.par1))
(test2 <- esgcortest(s0.par2))
par(mfrow=c(2, 1))
esgplotbands(test1)
esgplotbands(test2)



