library(bamlss)


### Name: predict.bamlss
### Title: BAMLSS Prediction
### Aliases: predict.bamlss
### Keywords: regression models

### ** Examples

## Not run: 
##D ## Generate some data.
##D d <- GAMart()
##D 
##D ## Model formula.
##D f <- list(
##D   num ~ s(x1) + s(x2) + s(x3) + te(lon,lat),
##D   sigma ~ s(x1) + s(x2) + s(x3) + te(lon,lat)
##D )
##D 
##D ## Estimate model.
##D b <- bamlss(f, data = d)
##D 
##D ## Predictions.
##D p <- predict(b)
##D str(b)
##D 
##D ## Prediction for "mu" model and term "s(x2)".
##D p <- predict(b, model = "mu", term = "s(x2)")
##D 
##D ## Plot effect
##D plot2d(p ~ x2, data = d)
##D 
##D ## Same for "sigma" model.
##D p <- predict(b, model = "sigma", term = "s(x2)")
##D plot2d(p ~ x2, data = d)
##D 
##D ## Prediction for "mu" model and term "s(x1)" + "s(x2)"
##D ## without intercept.
##D p <- predict(b, model = "mu", term = c("s(x1)", "s(x2)"),
##D   intercept = FALSE)
##D 
##D ## Prediction based on quantiles.
##D p <- predict(b, model = "mu", term = "s(x2)", FUN = c95)
##D plot2d(p ~ x2, data = d)
##D 
##D ## Extract samples of predictor for "s(x2)".
##D p <- predict(b, model = "mu", term = "s(x2)",
##D   intercept = FALSE, FUN = function(x) { x })
##D print(dim(p))
##D plot2d(p ~ x2, data = d, col.lines = rgb(0.1, 0.1, 0.1, alpha = 0.1))
##D 
##D ## Or using specific combinations of terms.
##D p <- predict(b, model = "mu", term = c("s(x2)", "te(lon,lat)"),
##D   intercept = FALSE, FUN = function(x) { x })
##D head(p)
##D 
##D ## Prediction using new data.
##D ## Only need x3 data when predicting
##D ## for s(x3).
##D nd <- data.frame("x3" = seq(0, 1, length = 100))
##D nd <- cbind(nd, predict(b, newdata = nd, term = "s(x3)"))
##D print(head(nd))
##D plot2d(mu ~ x3, data = nd)
##D plot2d(sigma ~ x3, data = nd)
## End(Not run)



