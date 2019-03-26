library(VGAM)


### Name: pneumo
### Title: Pneumoconiosis in Coalminers Data
### Aliases: pneumo
### Keywords: datasets

### ** Examples

# Fit the proportional odds model, p.179, in McCullagh and Nelder (1989)
pneumo <- transform(pneumo, let = log(exposure.time))
vglm(cbind(normal, mild, severe) ~ let, propodds, data = pneumo)



