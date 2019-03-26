library(gtx)


### Name: fitmix.r2
### Title: For finite mixture of univariate Gaussian densities, computes
###   proportion of variance explained by the mixture labels.
### Aliases: fitmix.r2

### ** Examples

xx <- fitmix.simulate(100, c(0.49, 0.42, 0.09), c(0, 1, 2), c(.3, .3, .3))

## additive model, common variance, Hardy--Weinberg
fit.a <- fitmix(xx, 3, maxit = 10, restarts = 3,
                sigma.common = TRUE, p.binomial = TRUE, mu.additive = TRUE)
fitmix.plot(xx, fit.a$p, fit.a$mu, fit.a$sigma)
fitmix.r2(fit.a$p, fit.a$mu, unique(fit.a$sigma))



