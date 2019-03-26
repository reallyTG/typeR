library(VGAM)


### Name: vgam.control
### Title: Control Function for vgam()
### Aliases: vgam.control
### Keywords: models regression smooth

### ** Examples

pneumo <- transform(pneumo, let = log(exposure.time))
vgam(cbind(normal, mild, severe) ~ s(let, df = 2), multinomial,
     data = pneumo, trace = TRUE, eps = 1e-4, maxit = 10)



