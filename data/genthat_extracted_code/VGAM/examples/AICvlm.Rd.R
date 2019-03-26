library(VGAM)


### Name: AICvlm
### Title: Akaike's Information Criterion
### Aliases: AICvlm AICvgam AICrrvglm AICqrrvglm AICrrvgam
### Keywords: models regression

### ** Examples

pneumo <- transform(pneumo, let = log(exposure.time))
(fit1 <- vglm(cbind(normal, mild, severe) ~ let,
              cumulative(parallel = TRUE, reverse = TRUE), data = pneumo))
coef(fit1, matrix = TRUE)
AIC(fit1)
AICc(fit1)  # Quick way
AIC(fit1, corrected = TRUE)  # Slow way
(fit2 <- vglm(cbind(normal, mild, severe) ~ let,
              cumulative(parallel = FALSE, reverse = TRUE), data = pneumo))
coef(fit2, matrix = TRUE)
AIC(fit2)
AICc(fit2)
AIC(fit2, corrected = TRUE)



