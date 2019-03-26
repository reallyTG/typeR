library(jointseg)


### Name: estimateSd
### Title: Robust standard deviation estimator
### Aliases: estimateSd

### ** Examples


n <- 1e4
y <- rnorm(n)  ## a signal with no change in mean
estimateSd(y)
estimateSd(y, method="von Neumann")
sd(y)
mad(y)

z <- y + rep(c(0,2), each=n/2)  ## a signal with *a single* change in mean
estimateSd(z)
estimateSd(z, method="von Neumann")
sd(z)
mad(z)

z <- y + rep(c(0,2), each=100)  ## a signal with many changes in mean
estimateSd(z)
estimateSd(z, method="von Neumann")
sd(z)
mad(z)  




