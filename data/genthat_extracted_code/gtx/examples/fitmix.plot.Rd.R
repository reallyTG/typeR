library(gtx)


### Name: fitmix.plot
### Title: Plot empirical density and components and total density for
###   finite mixture of univariate Gaussian densities.
### Aliases: fitmix.plot

### ** Examples

xx <- fitmix.simulate(100, c(0.49, 0.42, 0.09), c(0, 1, 2), c(.3, .3, .3))

## additive model, common variance, Hardy--Weinberg
fit.a <- fitmix(xx, 3, maxit = 10, restarts = 3,
                sigma.common = TRUE, p.binomial = TRUE, mu.additive = TRUE)
fitmix.plot(xx, fit.a$p, fit.a$mu, fit.a$sigma)

## general (unrestricted) fit
fit.g <- fitmix(xx, 3, maxit = 10, restarts = 3)
fitmix.plot(xx, fit.g$p, fit.g$mu, fit.g$sigma)



