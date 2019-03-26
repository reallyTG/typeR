library(fractal)


### Name: lyapunov
### Title: Local-Global Lyapunov Spectrum Estimation
### Aliases: lyapunov plot.lyapunov print.lyapunov print.summary.lyapunov
###   summary.lyapunov
### Keywords: univar models nonlinear

### ** Examples

## Calculate the local Lyapunov spectrum for the 
## beamchaos series 
z <- lyapunov(beamchaos)

## print the results 
print(z)

## summarize the results 
summary(z)

## plot the results 
plot(z)



