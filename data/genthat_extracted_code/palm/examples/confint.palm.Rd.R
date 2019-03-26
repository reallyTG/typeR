library(palm)


### Name: confint.palm
### Title: Extracts Neyman-Scott point process parameter confidence
###   intervals.
### Aliases: confint.palm

### ** Examples

## Fitting model.
fit <- fit.ns(example.2D, lims = rbind(c(0, 1), c(0, 1)), R = 0.5)
## Carrying out bootstrap.
fit <- boot.palm(fit, N = 100)
## Calculating 95% confidence intervals.
confint(fit)
## Estimates are very imprecise---these data were only used as
## they can be fitted and bootstrapped quickly for example purposes.




