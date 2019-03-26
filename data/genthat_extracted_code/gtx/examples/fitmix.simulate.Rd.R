library(gtx)


### Name: fitmix.simulate
### Title: Simulate from finite mixture of univariate Gaussian densities.
### Aliases: fitmix.simulate

### ** Examples

xx <- fitmix.simulate(100, c(0.49, 0.42, 0.09), c(0, 1, 2), c(.3, .3, .3))
plot(density(xx))



