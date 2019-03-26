library(adehabitatLT)


### Name: qqchi
### Title: Quantile-Quantile Plots for Trajectories of Class 'ltraj'
### Aliases: qqchi qqchi.default qqchi.ltraj qqnorm.ltraj
### Keywords: distribution

### ** Examples


## Example with an Arithmetic Brownian Process
toto <- simm.mba(1:500, sig = diag(c(5, 5)))
qqnorm(toto, "dx")
qqnorm(toto, "dy")
qqchi(toto)

## Example of wild boar
data(puechcirc)
qqnorm(puechcirc, "dx")
qqnorm(puechcirc, "dy")
qqchi(puechcirc)





