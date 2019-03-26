library(bamlss)


### Name: dl.bamlss
### Title: Deep Learning BAMLSS
### Aliases: dl.bamlss predict.dl.bamlss
### Keywords: regression

### ** Examples

## Not run: 
##D ## Simulate data.
##D set.seed(123)
##D n <- 300
##D x <- runif(n, -3, 3)
##D fsigma <- -2 + cos(x)
##D y <- sin(x) + rnorm(n, sd = exp(fsigma))
##D 
##D ## Setup model formula.
##D f <- list(
##D   y ~ x,
##D   sigma ~ x
##D )
##D 
##D ## Fit neural network.
##D library("keras")
##D b <- dl.bamlss(f)
##D 
##D ## Plot estimated functions.
##D par(mfrow = c(1, 2))
##D plot(x, y)
##D plot2d(fitted(b)$mu ~ x, add = TRUE)
##D plot2d(fitted(b)$sigma ~ x,
##D   ylim = range(c(fitted(b)$sigma, fsigma)))
##D plot2d(fsigma ~ x, add = TRUE, col.lines = "red")
##D 
##D ## Another example identifying structures that are
##D ## not captured by the initial model.
##D set.seed(123)
##D d <- GAMart()
##D b1 <- bamlss(num ~ s(x1) + s(x2) + s(x3), data = d, sampler = FALSE)
##D b2 <- dl.bamlss(num ~ lon + lat, data = d, offset = fitted(b1))
##D p <- predict(b2, model = "mu")
##D par(mfrow = c(1, 1))
##D plot3d(p ~ lon + lat, data = d, symmetric = FALSE)
## End(Not run)



