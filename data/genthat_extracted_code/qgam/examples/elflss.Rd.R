library(qgam)


### Name: elflss
### Title: Extended log-F model with variable scale
### Aliases: elflss

### ** Examples

## Not run: 
##D set.seed(651)
##D n <- 1000
##D x <- seq(-4, 3, length.out = n)
##D X <- cbind(1, x, x^2)
##D beta <- c(0, 1, 1)
##D sigma =  1.2 + sin(2*x)
##D f <- drop(X %*% beta)
##D dat <- f + rnorm(n, 0, sigma)
##D dataf <- data.frame(cbind(dat, x))
##D names(dataf) <- c("y", "x")
##D 
##D # Fit median using elf directly: NOT RECOMMENDED
##D fit <- gam(list(y~s(x, bs = "cr"), ~ s(x, bs = "cr")), 
##D            family = elflss(theta = 0, co = rep(0.2, n), qu = 0.5), 
##D            data = dataf)
##D 
##D plot(x, dat, col = "grey", ylab = "y")
##D tmp <- predict(fit, se = TRUE)
##D lines(x, tmp$fit[ , 1])
##D lines(x, tmp$fit[ , 1] + 3 * tmp$se.fit[ , 1], col = 2)
##D lines(x, tmp$fit[ , 1] - 3 * tmp$se.fit[ , 1], col = 2)      
##D 
##D # Use qgam: RECOMMENDED
##D fit <- qgam(list(y~s(x, bs = "cr"), ~ s(x, bs = "cr")), 
##D             data = dataf, qu = 0.5, err = 0.2, lsig = 0) 
##D 
##D plot(x, dat, col = "grey", ylab = "y")
##D tmp <- predict(fit, se = TRUE)
##D lines(x, tmp$fit[ , 1])
##D lines(x, tmp$fit[ , 1] + 3 * tmp$se.fit[ , 1], col = 2)
##D lines(x, tmp$fit[ , 1] - 3 * tmp$se.fit[ , 1], col = 2)
## End(Not run)




