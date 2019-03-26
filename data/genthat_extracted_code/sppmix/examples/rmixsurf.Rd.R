library(sppmix)


### Name: rmixsurf
### Title: Generate a Poisson process surface object
### Aliases: rmixsurf

### ** Examples

## No test: 
mixsurf1 <- rmixsurf(m = 3, lambda=100)
summary(mixsurf1)
plot(mixsurf1)
plotmix_2d(mixsurf1)
mixsurf2 <- rmixsurf(m = 5, lambda=200, rand_m = TRUE, ylim = c(-3, 3))
summary(mixsurf2)
plot(mixsurf2)
plotmix_2d(mixsurf2)
mixsurf3 <- rmixsurf(m = 5, lambda=200, rand_m = TRUE, Sigma0=.01*diag(2))
summary(mixsurf3)
plot(mixsurf3)
plotmix_2d(mixsurf3)
## End(No test)




