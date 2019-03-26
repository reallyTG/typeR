library(VGAM)


### Name: vglm-class
### Title: Class "vglm"
### Aliases: vglm-class
### Keywords: classes

### ** Examples

# Multinomial logit model
pneumo <- transform(pneumo, let = log(exposure.time))
vglm(cbind(normal, mild, severe) ~ let, multinomial, data = pneumo)



