library(diffusion)


### Name: diffusion
### Title: Fit various diffusion curves.
### Aliases: diffusion

### ** Examples

 fitbass <- diffusion(tsChicken[, 2], type = "bass")
 fitgomp <- diffusion(tsChicken[, 2], type = "gompertz")
 fitgsg <- diffusion(tsChicken[, 2], type = "gsgompertz")
 
 # Produce some plots
 plot(fitbass)
 plot(fitgomp)
 plot(fitgsg)




