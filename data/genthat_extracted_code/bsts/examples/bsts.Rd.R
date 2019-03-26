library(bsts)


### Name: bsts
### Title: Bayesian structural time series
### Aliases: bsts
### Keywords: models regression

### ** Examples

  ## Example 1:  Time series (ts) data
  data(AirPassengers)
  y <- log(AirPassengers)
  ss <- AddLocalLinearTrend(list(), y)
  ss <- AddSeasonal(ss, y, nseasons = 12)
  model <- bsts(y, state.specification = ss, niter = 500)
  pred <- predict(model, horizon = 12, burn = 100)
  par(mfrow = c(1,2))
  plot(model)
  plot(pred)

## Not run: 
##D 
##D   MakePlots <- function(model, ask = TRUE) {
##D     ## Make all the plots callable by plot.bsts.
##D     opar <- par(ask = ask)
##D     on.exit(par(opar))
##D     plot.types <- c("state", "components", "residuals",
##D                     "prediction.errors", "forecast.distribution")
##D     for (plot.type in plot.types) {
##D       plot(model, plot.type)
##D     }
##D     if (model$has.regression) {
##D       regression.plot.types <- c("coefficients", "predictors", "size")
##D       for (plot.type in regression.plot.types) {
##D         plot(model, plot.type)
##D       }
##D     }
##D   }
##D 
##D   ## Example 2: GOOG is the Google stock price, an xts series of daily
##D   ##            data.
##D   data(goog)
##D   ss <- AddGeneralizedLocalLinearTrend(list(), goog)
##D   model <- bsts(goog, state.specification = ss, niter = 500)
##D   MakePlots(model)
##D 
##D   ## Example 3:  Change GOOG to be zoo, and not xts.
##D   goog <- zoo(goog, index(goog))
##D   ss <- AddGeneralizedLocalLinearTrend(list(), goog)
##D   model <- bsts(goog, state.specification = ss, niter = 500)
##D   MakePlots(model)
##D 
##D   ## Example 4:  Naked numeric data works too
##D   y <- rnorm(100)
##D   ss <- AddLocalLinearTrend(list(), y)
##D   model <- bsts(y, state.specification = ss, niter = 500)
##D   MakePlots(model)
##D 
##D   ## Example 5:  zoo data with intra-day measurements
##D   y <- zoo(rnorm(100),
##D            seq(from = as.POSIXct("2012-01-01 7:00 EST"), len = 100, by = 100))
##D   ss <- AddLocalLinearTrend(list(), y)
##D   model <- bsts(y, state.specification = ss, niter = 500)
##D   MakePlots(model)
##D 
##D \dontrun{
##D   ## Example 6:  Including regressors
##D   data(iclaims)
##D   ss <- AddLocalLinearTrend(list(), initial.claims$iclaimsNSA)
##D   ss <- AddSeasonal(ss, initial.claims$iclaimsNSA, nseasons = 52)
##D   model <- bsts(iclaimsNSA ~ ., state.specification = ss, data =
##D                 initial.claims, niter = 1000)
##D   plot(model)
##D   plot(model, "components")
##D   plot(model, "coefficients")
##D   plot(model, "predictors")
##D }
## End(Not run)

## Not run: 
##D   ## Example 7:  Regressors with multiple time stamps.
##D   number.of.time.points <- 50
##D   sample.size.per.time.point <- 10
##D   total.sample.size <- number.of.time.points * sample.size.per.time.point
##D   sigma.level <- .1
##D   sigma.obs <- 1
##D 
##D   ## Simulate some fake data with a local level state component.
##D   trend <- cumsum(rnorm(number.of.time.points, 0, sigma.level))
##D   predictors <- matrix(rnorm(total.sample.size * 2), ncol = 2)
##D   colnames(predictors) <- c("X1", "X2")
##D   coefficients <- c(-10, 10)
##D   regression <- as.numeric(predictors %*% coefficients)
##D   y.hat <- rep(trend, sample.size.per.time.point) + regression
##D   y <- rnorm(length(y.hat), y.hat, sigma.obs)
##D 
##D   ## Create some time stamps, with multiple observations per time stamp.
##D   first <- as.POSIXct("2013-03-24")
##D   dates <- seq(from = first, length = number.of.time.points, by = "month")
##D   timestamps <- rep(dates, sample.size.per.time.point)
##D 
##D   ## Run the model with a local level trend, and an unnecessary seasonal component.
##D   ss <- AddLocalLevel(list(), y)
##D   ss <- AddSeasonal(ss, y, nseasons = 7)
##D   model <- bsts(y ~ predictors, ss, niter = 250, timestamps = timestamps,
##D                 seed = 8675309)
##D   plot(model)
##D   plot(model, "components")
## End(Not run)

## Example 8: Non-Gaussian data
## Poisson counts of shark attacks in Florida.
data(shark)
logshark <- log1p(shark$Attacks)
ss.level <- AddLocalLevel(list(), y = logshark)
model <- bsts(shark$Attacks, ss.level, niter = 500,
              ping = 250, family = "poisson", seed = 8675309)

## Poisson data can have an 'exposure' as the second column of a
## two-column matrix.
model <- bsts(cbind(shark$Attacks, shark$Population / 1000),
              state.specification = ss.level, niter = 500, 
              family = "poisson", ping = 250, seed = 8675309)




