library(VGAM)


### Name: vplot.profile
### Title: Plotting Functions for 'profile' Objects
### Aliases: vplot.profile vpairs.profile
### Keywords: models hplot

### ** Examples

pneumo <- transform(pneumo, let = log(exposure.time))
fit1 <- vglm(cbind(normal, mild, severe) ~ let, acat,
             trace = TRUE, data = pneumo)
pfit1 <- profile(fit1, trace = FALSE)
## Not run: 
##D vplot.profile(pfit1)
##D vpairs.profile(pfit1)
## End(Not run)



