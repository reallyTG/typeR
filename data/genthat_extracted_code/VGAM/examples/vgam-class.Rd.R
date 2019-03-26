library(VGAM)


### Name: vgam-class
### Title: Class "vgam"
### Aliases: vgam-class
### Keywords: classes models regression smooth

### ** Examples

# Fit a nonparametric proportional odds model
pneumo <- transform(pneumo, let = log(exposure.time))
vgam(cbind(normal, mild, severe) ~ s(let),
     cumulative(parallel = TRUE), data = pneumo)



