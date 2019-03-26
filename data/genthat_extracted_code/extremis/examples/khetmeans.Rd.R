library(extremis)


### Name: khetmeans
### Title: K-Means Clustering for Heteroscedastic Extremes
### Aliases: khetmeans khetmeans.default

### ** Examples

## Not run: 
##D ## Example 1  (Scenario B, T = 5000)
##D ## This example requires package evd 
##D require(evd)
##D set.seed(12)
##D T <- 5000
##D n <- 30
##D b <- 0.1
##D gamma1 <- 0.7
##D gamma2 <- 1
##D grid <- seq(0, 1, length = 100)
##D c2 <- function(s)
##D     dbeta(s, 2, 5)
##D c3 <- function(s)
##D     dbeta(s, 5, 2)
##D X <- matrix(0, ncol = T, nrow = n)
##D for(i in 1:5)
##D   for(j in 1:T)
##D     X[i,  j] <- rgev(1, c2(j / T), c2(j / T), gamma1)
##D for(i in 6:15)
##D   for(j in 1:T)
##D     X[i,  j] <- rgev(1, c2(j / T), c2(j / T), gamma2)
##D for(i in 16:20)
##D   for(j in 1:T)
##D     X[i,  j] <- rgev(1, c3(j / T), c3(j / T), gamma1)
##D for(i in 21:30)
##D   for(j in 1:T)
##D     X[i,  j] <- rgev(1, c3(j / T), c3(j / T), gamma2)
##D Y <- t(X)
##D fit <- khetmeans(Y, centers = 4)
##D plot(fit, c.c = TRUE)
##D lines(grid, c2(grid), type = 'l', lwd = 8, col = 'black')
##D lines(grid, c3(grid), type = 'l', lwd = 8, col = 'black')
## End(Not run)

## Not run: 
##D ## Example 2 (Overlapping version of Fig. 5 in Supplementary Materials)
##D data(lse)
##D attach(lse)
##D y <- -apply(log(lse[, -1]), 2, diff)
##D fit <- khetmeans(y, centers = 3)
##D plot(fit, c.c = TRUE, ylim = c(0, 3))
## End(Not run)



