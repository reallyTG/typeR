library(bamlss)


### Name: bboost
### Title: Bootstrap Boosting
### Aliases: bboost predict.bboost bboost.plot
### Keywords: regression

### ** Examples

## Not run: 
##D ## Simulate data.
##D set.seed(123)
##D d <- GAMart()
##D 
##D ## Estimate model.
##D f <- num ~ s(x1) + s(x2) + s(x3) + s(lon,lat)
##D 
##D ## Function for evaluation of hold out sample
##D ## criterion to find the optimum mstop.
##D fmstop <- function(model, data) {
##D   p <- predict(model, newdata = data, model = "mu")
##D   mse <- NULL
##D   for(i in 1:nrow(model$parameters))
##D     mse <- c(mse, mean((data$num - p[, i])^2))
##D   list("MSE" = mse, "mstop" = which.min(mse))
##D }
##D 
##D ## Bootstrap boosted models.
##D b <- bboost(f, data = d, n = 50, cores = 3, fmstop = fmstop)
##D 
##D ## Plot hold out sample MSE.
##D bboost.plot(b)
##D 
##D ## Predict for each bootstrap sample.
##D nd <- data.frame("x2" = seq(0, 1, length = 100))
##D p <- predict(b, newdata = nd, model = "mu", term = "x2")
##D plot2d(p ~ x2, data = nd)
## End(Not run)



