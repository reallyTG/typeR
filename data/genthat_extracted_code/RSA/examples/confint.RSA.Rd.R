library(RSA)


### Name: confint.RSA
### Title: Computes confidence intervals for RSA parameters, standard or
###   bootstrapped
### Aliases: confint.RSA confint

### ** Examples


## Not run: 
##D set.seed(0xBEEF)
##D n <- 300
##D err <- 2
##D x <- rnorm(n, 0, 5)
##D y <- rnorm(n, 0, 5)
##D df <- data.frame(x, y)
##D df <- within(df, {
##D 	diff <- x-y
##D 	absdiff <- abs(x-y)
##D 	SD <- (x-y)^2
##D 	z.sq <- SD + rnorm(n, 0, err)
##D })
##D 
##D r1 <- RSA(z.sq~x*y, df, models="SSQD")
##D (c1 <- confint(r1, model="SSQD"))
##D 
##D # Dummy example with 10 bootstrap replications - better use >= 5000!
##D (c2 <- confint(r1, model="SSQD", method="boot", R=10))
##D # multicore version
##D confint(r1, model="SSQD", R=5000, parallel="multicore", ncpus=2)
## End(Not run)



