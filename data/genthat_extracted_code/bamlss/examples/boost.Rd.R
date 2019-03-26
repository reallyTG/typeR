library(bamlss)


### Name: boost
### Title: Boosting BAMLSS
### Aliases: boost boostm boost.summary boost.plot print.boost.summary
###   plot.boost.summary boost.frame
### Keywords: regression

### ** Examples

## Not run: 
##D ## Simulate data.
##D set.seed(123)
##D d <- GAMart()
##D 
##D ## Estimate model.
##D f <- num ~ x1 + x2 + x3 + lon + lat +
##D   s(x1) + s(x2) + s(x3) + s(lon) + s(lat) + te(lon,lat)
##D 
##D b <- bamlss(f, data = d, optimizer = boost,
##D   sampler = FALSE, scale.d = TRUE, nu = 0.01,
##D   maxit = 1000, plot = FALSE)
##D 
##D ## Plot estimated effects.
##D plot(b)
##D 
##D ## Print and plot the boosting summary.
##D boost.summary(b, plot = FALSE)
##D boost.plot(b, which = 1)
##D boost.plot(b, which = 2)
##D boost.plot(b, which = 3, name = "mu.s.te(lon,lat).")
##D 
##D ## Extract estimated parameters for certain
##D ## boosting iterations.
##D parameters(b, mstop = 1)
##D parameters(b, mstop = 100)
##D 
##D ## Also works with predict().
##D head(do.call("cbind", predict(b, mstop = 1)))
##D head(do.call("cbind", predict(b, mstop = 100)))
##D 
##D ## Another example using the modified liklihood
##D ## bootsing algorithm.
##D f <- list(
##D   num ~ x1 + x2 + x3 + lon + lat +
##D     s(x1) + s(x2) + s(x3) + s(lon) + s(lat) + te(lon,lat),
##D   sigma ~ x1 + x2 + x3 + lon + lat +
##D     s(x1) + s(x2) + s(x3) + s(lon) + s(lat) + te(lon,lat)
##D )
##D 
##D b <- bamlss(f, data = d, optimizer = boostm,
##D   sampler = FALSE, scale.d = TRUE, nu = 0.05,
##D   maxit = 400, stop.criterion = "AIC", force.stop = FALSE)
##D 
##D ## Plot estimated effects.
##D plot(b)
##D 
##D ## Plot AIC and log-lik contributions.
##D boost.plot(b, "AIC")
##D boost.plot(b, "loglik.contrib")
##D 
##D ## Out-of-sample selection of model terms.
##D set.seed(123)
##D d <- GAMart(n = 5000)
##D 
##D ## Split data into training and testing
##D i <- sample(1:2, size = nrow(d), replace = TRUE)
##D d.test <- subset(d, i == 1)
##D d.train <- subset(d, i == 2)
##D 
##D ## Model formula
##D f <- list(
##D   num ~ s(x1) + s(x2) + s(x3),
##D   sigma ~ s(x1) + s(x2) + s(x3)
##D )
##D 
##D ## Create model frame for out-of-sample selection.
##D sm <- boost.frame(f, train = d.train, test = d.test, family = "gaussian")
##D 
##D ## Out-of-sample selection function.
##D sfun <- function(parameters) {
##D   sm$parameters <- parameters
##D   p <- predict(sm, type = "parameter")
##D   -1 * sum(sm$family$d(d.test$num, p, log = TRUE))
##D }
##D 
##D ## Start boosting with out-of-sample negative
##D ## log-likelihood selection of model terms.
##D b <- bamlss(f, data = d.train, sampler = FALSE, optimizer = boost,
##D   selectfun = sfun, always = "best")
##D 
##D ## Plot curve of negative out-of-sample log-likelihood.
##D boost.plot(b, which = "user")
## End(Not run)



