library(WRS2)


### Name: Qanova
### Title: Quantile ANOVA
### Aliases: Qanova
### Keywords: models

### ** Examples

## median comparison
set.seed(123)
fitmed <- Qanova(libido ~ dose, viagra, nboot = 200)
fitmed

## 1st, 3rd quartile comparison
set.seed(123)
fitquart <- Qanova(libido ~ dose, viagra, q = c(0.25, 0.75), nboot = 200)
fitquart






