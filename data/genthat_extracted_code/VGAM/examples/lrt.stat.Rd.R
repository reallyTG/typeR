library(VGAM)


### Name: lrt.stat
### Title: Likelihood Ratio Test Statistics Evaluated at the Null Values
### Aliases: lrt.stat lrt.stat.vlm
### Keywords: models regression

### ** Examples

pneumo <- transform(pneumo, let = log(exposure.time))
fit <- vglm(cbind(normal, mild, severe) ~ let, propodds, data = pneumo)
cbind(coef(summary(fit)),
      "signed LRT stat" = lrt.stat(fit, omit1s = FALSE))
summary(fit, lrt0 = TRUE)  # Easy way to get it



