library(VGAM)


### Name: coefvgam
### Title: Extract Model Coefficients of a vgam() Object
### Aliases: coefvgam coef,vgam-method coefficients,vgam-method
### Keywords: models regression

### ** Examples

fit <- vgam(agaaus ~ s(altitude, df = 2), binomialff, data = hunua)
coef(fit)  # Same as coef(fit, type = "linear")
(ii <- coef(fit, type = "nonlinear"))
is.list(ii)
names(ii)
slotNames(ii[[1]])



