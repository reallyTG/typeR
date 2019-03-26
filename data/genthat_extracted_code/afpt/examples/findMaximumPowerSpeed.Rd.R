library(afpt)


### Name: findMaximumPowerSpeed
### Title: Finds speed for which power required equals maximum available
###   power
### Aliases: findMaximumPowerSpeed

### ** Examples

## Define a bird:
myBird <- Bird(
  massTotal = 0.215, #  (kg) total body mass
  wingSpan = 0.67, #  (m) maximum wing span
  wingArea = 0.0652, #  (m2) maximum wing area
  type = "passerine"
)

Paero.available  <- computeAvailablePower(myBird)

## find maximum speed:
Vmin <- 5
Vmax <- 30
Paero.maxSpeed <- findMaximumPowerSpeed(myBird,Paero.available,Vmin,Vmax)
print(Paero.maxSpeed[c('speed','power','amplitude','strokeplane','frequency')])
#      speed    power amplitude strokeplane frequency
# 1 16.58797 5.233459  50.22762    6.812345  5.948083



