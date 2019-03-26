library(VGAM)


### Name: R2latvar
### Title: R-squared for Latent Variable Models
### Aliases: R2latvar
### Keywords: models regression

### ** Examples

pneumo <- transform(pneumo, let = log(exposure.time))
(fit <- vglm(cbind(normal, mild, severe) ~ let, propodds, data = pneumo))
R2latvar(fit)



