library(VGAM)


### Name: wald.stat
### Title: Wald Test Statistics Evaluated at the Null Values
### Aliases: wald.stat wald.stat.vlm
### Keywords: models regression

### ** Examples

set.seed(1)
pneumo <- transform(pneumo, let = log(exposure.time),
                            x3 = rnorm(nrow(pneumo)))
(fit <- vglm(cbind(normal, mild, severe) ~ let + x3,
             propodds, data = pneumo))
wald.stat(fit)  # No HDE here
summary(fit, wald0 = TRUE)  # See them here
coef(summary(fit))  # Usual Wald statistics evaluated at the MLE
wald.stat(fit, as.summary = TRUE)  # Same as previous line



