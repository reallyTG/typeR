library(VGAM)


### Name: summaryvglm
### Title: Summarizing Vector Generalized Linear Model Fits
### Aliases: summaryvglm show.summary.vglm
### Keywords: models regression

### ** Examples

## For examples see example(glm)
pneumo <- transform(pneumo, let = log(exposure.time))
(afit <- vglm(cbind(normal, mild, severe) ~ let, acat, data = pneumo))
coef(afit, matrix = TRUE)
summary(afit)  # Might suffer from the Hauck-Donner effect
coef(summary(afit))
summary(afit, lrt0 = TRUE, score0 = TRUE, wald0 = TRUE)



