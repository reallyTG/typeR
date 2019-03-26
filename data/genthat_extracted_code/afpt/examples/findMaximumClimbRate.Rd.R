library(afpt)


### Name: findMaximumClimbRate
### Title: Find maximum climb rate
### Aliases: findMaximumClimbRate

### ** Examples

## Define a bird:
myBird = Bird(
  massTotal = 0.215, #  (kg) total body mass
  wingSpan = 0.67, #  (m) maximum wing span
  wingArea = 0.0652, #  (m2) maximum wing area
  type = "passerine"
)

## maximum power available:
Paero.available <- computeAvailablePower(myBird)

climbSpeed <- 8 #  airspeed during climb

## find maximum climbrate:
Paero.climb <- findMaximumClimbRate(myBird,Paero.available,climbSpeed)
print(Paero.climb[c('speed','amplitude','frequency','climbRate')])
#   speed amplitude frequency climbRate
# 1     8  54.84965  5.948083  1.162002




