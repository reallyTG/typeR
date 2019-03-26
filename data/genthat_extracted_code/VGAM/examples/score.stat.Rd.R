library(VGAM)


### Name: score.stat
### Title: Rao's Score Test Statistics Evaluated at the Null Values
### Aliases: score.stat score.stat.vlm
### Keywords: models regression

### ** Examples

set.seed(1)
pneumo <- transform(pneumo, let = log(exposure.time),
                            x3 = rnorm(nrow(pneumo)))
(pfit <- vglm(cbind(normal, mild, severe) ~ let + x3,
             propodds, data = pneumo))
score.stat(pfit)  # No HDE here; should be similar to the next line:
coef(summary(pfit))[, "z value"]  # Wald statistics computed at the MLE
summary(pfit, score0 = TRUE)



