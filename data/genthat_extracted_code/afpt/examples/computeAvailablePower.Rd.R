library(afpt)


### Name: computeAvailablePower
### Title: Compute available power
### Aliases: computeAvailablePower

### ** Examples

## Define a bird:
myBird = Bird(
  massTotal = 0.215, #  (kg) total body mass
  wingSpan = 0.67, #  (m) maximum wing span
  wingArea = 0.0652, #  (m2) maximum wing area
  type = "passerine"
)

## for maximum continuous power
power.max <- computeAvailablePower(myBird)
print(power.max)
#   [1] 5.233528

## for specified maximum continuous power:
power.max.continuous <- 0.8*power.max
power.max.burst <- computeAvailablePower(myBird,power.max.continuous)
print(power.max.burst)
#   [1] 5.466625




