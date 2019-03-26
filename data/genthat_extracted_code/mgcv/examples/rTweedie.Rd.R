library(mgcv)


### Name: rTweedie
### Title: Generate Tweedie random deviates
### Aliases: rTweedie
### Keywords: models regression

### ** Examples

 library(mgcv)
 f2 <- function(x) 0.2 * x^11 * (10 * (1 - x))^6 + 10 *
            (10 * x)^3 * (1 - x)^10
 n <- 300
 x <- runif(n)
 mu <- exp(f2(x)/3+.1);x <- x*10 - 4
 y <- rTweedie(mu,p=1.5,phi=1.3)
 b <- gam(y~s(x,k=20),family=Tweedie(p=1.5))
 b
 plot(b) 




