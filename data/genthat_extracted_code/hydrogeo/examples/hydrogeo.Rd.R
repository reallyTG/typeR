library(hydrogeo)


### Name: hydrogeo
### Title: Groundwater data presentation and interpretation.
### Aliases: hydrogeo hydrogeo-package
### Keywords: groundwater hydrogeology hydrology package water

### ** Examples

library(hydrogeo)
data(zaporozec)
zaporozec$CO3 <- rep(0,9) # toPercent expects CO3
zaporozec$Na <- rep(0,9)  # toPercent expects Na
z <- toPercent(zaporozec)
pz <- piper(z)
plot(pz,cex=1.5)



