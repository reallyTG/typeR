library(gamboostLSS)


### Name: methods
### Title: Methods for mboostLSS
### Aliases: print.mboostLSS summary.mboostLSS coef.mboostLSS
###   coef.glmboostLSS risk risk.mboostLSS risk.nc_mboostLSS [.mboostLSS
###   mstop.mboostLSS mstop.oobag mstop.cvriskLSS selected
###   selected.mboostLSS fitted.mboostLSS predict.mboostLSS predint PI
###   plot.glmboostLSS plot.gamboostLSS plot.predint update.mboostLSS
###   model.weights model.weights.default model.weights.mboostLSS
### Keywords: methods

### ** Examples


### generate data
set.seed(1907)
x1 <- rnorm(1000)
x2 <- rnorm(1000)
x3 <- rnorm(1000)
x4 <- rnorm(1000)
x5 <- rnorm(1000)
x6 <- rnorm(1000)
mu    <- exp(1.5 + x1^2 +0.5 * x2 - 3 * sin(x3) -1 * x4)
sigma <- exp(-0.2 * x4 +0.2 * x5 +0.4 * x6)
y <- numeric(1000)
for( i in 1:1000)
    y[i] <- rnbinom(1, size = sigma[i], mu = mu[i])
dat <- data.frame(x1, x2, x3, x4, x5, x6, y)

### fit a model
model <- gamboostLSS(y ~ ., families = NBinomialLSS(), data = dat,
                     control = boost_control(mstop = 100))

## No test: 
### Do not test the following line per default on CRAN as it takes some time to run:
### use a model with more iterations for a better fit
mstop(model) <- 400
## End(No test)
### extract coefficients
coef(model)

### only for distribution parameter mu
coef(model, parameter = "mu")

### only for covariate x1
coef(model, which = "x1")


### plot complete model
par(mfrow = c(4, 3))
plot(model)
### plot first parameter only
par(mfrow = c(2, 3))
plot(model, parameter = "mu")
### now plot only effect of x3 of both parameters
par(mfrow = c(1, 2))
plot(model, which = "x3")
### first component second parameter (sigma)
par(mfrow = c(1, 1))
plot(model, which = 1, parameter = 2)

## No test: 
### Do not test the following code per default on CRAN as it takes some time to run:
### plot marginal prediction interval
pi <- predint(model, pi = 0.9, which = "x1")
pi <- predint(model, pi = c(0.8, 0.9), which = "x1")
plot(pi, log = "y")  # warning as some y values are below 0
## here it would be better to plot x1 against
## sqrt(y) and sqrt(pi)

### set model to mstop = 300 (one-dimensional)
mstop(model) <- 300
### END (don't test automatically)
## End(No test)

par(mfrow = c(2, 2))
plot(risk(model, parameter = "mu")[[1]])
plot(risk(model, parameter = "sigma")[[1]])

## No test: 
### Do not test the following code per default on CRAN as it takes some time to run:
### get back to orignal fit
mstop(model) <- 400
plot(risk(model, parameter = "mu")[[1]])
plot(risk(model, parameter = "sigma")[[1]])

### use different mstop values for the components
mstop(model) <- c(100, 200)
## same as
  mstop(model) <- c(mu = 100, sigma = 200)
## or
  mstop(model) <- list(mu = 100, sigma = 200)
## or
  mstop(model) <- list(100, 200)

plot(risk(model, parameter = "mu")[[1]])
plot(risk(model, parameter = "sigma")[[1]])
### END (don't test automatically)
## End(No test)



