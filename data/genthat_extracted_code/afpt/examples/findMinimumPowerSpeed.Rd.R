library(afpt)


### Name: findMinimumPowerSpeed
### Title: Find speed for minimum power
### Aliases: findMinimumPowerSpeed

### ** Examples

## Define a bird:
myBird = Bird(
  massTotal = 0.215, #  (kg) total body mass
  wingSpan = 0.67, #  (m) maximum wing span
  wingArea = 0.0652, #  (m2) maximum wing area
  type = "passerine"
)

minimumPowerSpeed.aero <- findMinimumPowerSpeed(myBird)
minimumPowerSpeed.aero[c('speed','power','strokeplane','amplitude','frequency')]
#      speed    power strokeplane amplitude frequency
# 1 8.030022 2.092976    28.14514  34.52719  5.948083



