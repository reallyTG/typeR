library(alphahull)


### Name: dw
### Title: Devroye-Wise estimator
### Aliases: dw
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # Uniform sample of size n = 200 in the annulus B(c, 0.5)\B(c, 0.25), 
##D # with c = (0.5, 0.5).
##D n <- 200
##D theta <- runif(n, 0, 2*pi)
##D r <- sqrt(runif(n, 0.25^2, 0.5^2))
##D x <- cbind(0.5 + r*cos(theta), 0.5 + r*sin(theta))
##D eps <- 0.05
##D dw.obj <- dw(x, eps = eps)
##D plot(x)
##D for(i in 1:dim(dw.obj)[1]){arc(dw.obj[i, 1:2], eps, dw.obj[i, 4:5], dw.obj[i, 6])}
## End(Not run)



