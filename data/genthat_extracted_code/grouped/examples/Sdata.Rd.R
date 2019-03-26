library(grouped)


### Name: Sdata
### Title: Simulated Data
### Aliases: Sdata
### Keywords: datasets

### ** Examples


## Not run: 
##D n <- 250
##D treat <- rbinom(n, 1, 0.5)
##D x <- runif(n, -4, 4)
##D mu <- 1 + 0.5 * treat -1 * x + 0.8 * treat * x
##D u <- plogis(rnorm(n, mu, 2))
##D 
##D index <- cbind(c(0, 0.25, 0.5, 0.75), c(0.25, 0.5, 0.75, 1)) 
##D a <- b <- numeric(n)
##D for(i in 1:n){
##D     ind <- which(index[, 2] - u[i] > 0)[1]
##D     a[i] <- index[ind, 1]
##D     b[i] <- index[ind, 2]
##D }
##D Sdata <- data.frame(lo = a, up = b, treat = factor(treat), x)
## End(Not run)

str(Sdata)
summary(Sdata)




