library(tsoutliers)


### Name: discard.outliers
### Title: Stage II of the Procedure: Discard Outliers
### Aliases: discard.outliers
### Keywords: ts

### ** Examples

## Not run: 
##D data("hicp")
##D y <- log(hicp[["011600"]])
##D fit <- arima(y, order = c(1, 1, 0), seasonal = list(order = c(2, 0, 2)))
##D # initial set of outliers
##D res <- locate.outliers.oloop(y, fit, types = c("AO", "LS", "TC"))
##D res$outliers
##D # given the model fitted above, the effect on the data of some of 
##D # the outliers is not significant (method = "en-masse")
##D discard.outliers(res, y, method = "en-masse", 
##D   tsmethod.call = fit$call)$outliers
##D # in this case, using method = "bottom-up" the first four 
##D # outliers with higher t-statistic are kept
##D discard.outliers(res, y, method = "bottom-up", 
##D   tsmethod.call = fit$call)$outliers
## End(Not run)



