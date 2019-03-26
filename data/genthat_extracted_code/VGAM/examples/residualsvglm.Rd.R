library(VGAM)


### Name: residualsvglm
### Title: Residuals for a VGLM fit
### Aliases: residualsvglm
### Keywords: models regression

### ** Examples

pneumo <- transform(pneumo, let = log(exposure.time))
fit <- vglm(cbind(normal, mild, severe) ~ let, propodds, data = pneumo)
resid(fit)  # Same as having type = "working" (the default)
resid(fit, type = "response")
resid(fit, type = "pearson")
resid(fit, type = "stdres")  # Test for independence



