library(VGAM)


### Name: nparam.vlm
### Title: Number of Parameters
### Aliases: nparam.vlm nparam nparam.vgam nparam.rrvglm nparam.qrrvglm
###   nparam.rrvgam
### Keywords: models regression

### ** Examples

pneumo <- transform(pneumo, let = log(exposure.time))
(fit1 <- vglm(cbind(normal, mild, severe) ~ let, propodds, data = pneumo))
coef(fit1)
coef(fit1, matrix = TRUE)
nparam(fit1)
(fit2 <- vglm(hits ~ 1, poissonff, weights = ofreq, data = V1))
coef(fit2)
coef(fit2, matrix = TRUE)
nparam(fit2)
nparam(fit2, dpar = FALSE)



