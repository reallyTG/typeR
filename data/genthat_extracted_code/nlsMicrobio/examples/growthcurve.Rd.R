library(nlsMicrobio)


### Name: growthcurve
### Title: Bacterial kinetics data sets
### Aliases: growthcurve1 growthcurve2 growthcurve3 growthcurve4
### Keywords: datasets

### ** Examples

data(growthcurve1)
data(growthcurve2)
data(growthcurve3)
data(growthcurve4)
def.par <- par(no.readonly = TRUE)
par(mfrow = c(2,2))
plot(growthcurve1)
plot(growthcurve2)
plot(growthcurve3)
plot(growthcurve4)
par(def.par)



