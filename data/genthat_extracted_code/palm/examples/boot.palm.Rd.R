library(palm)


### Name: boot.palm
### Title: Bootstrapping for fitted models
### Aliases: boot.palm

### ** Examples

## Fit model.
fit <- fit.ns(example.2D, lims = rbind(c(0, 1), c(0, 1)), R = 0.5)
## Carry out bootstrap.
fit <- boot.palm(fit, N = 100)
## Inspect standard errors and confidence intervals.
summary(fit)
confint(fit)
## Estimates are very imprecise---these data were only used as
## they can be fitted and bootstrapped quickly for example purposes.




