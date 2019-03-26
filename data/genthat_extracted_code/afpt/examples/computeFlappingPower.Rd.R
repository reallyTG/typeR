library(afpt)


### Name: computeFlappingPower
### Title: Calculate aerodynamic power flapping flight
### Aliases: computeFlappingPower

### ** Examples

## Define a bird:
myBird = Bird(
  massTotal = 0.215, #  (kg) total body mass
  wingSpan = 0.67, #  (m) maximum wing span
  wingArea = 0.0652, #  (m2) maximum wing area
  type = "passerine"
)

## define a speed range
speedrange <- seq(5,14,length.out=5)

## compute aerodynamic power for that speed range:
Paero <- computeFlappingPower(myBird,speedrange)
print(Paero[c("speed","power","frequency","strokeplane")])
#   speed    power frequency strokeplane
# 1  5.00 2.789751  5.948083    46.56887
# 2  7.25 2.129466  5.948083    31.89129
# 3  9.50 2.203773  5.948083    22.51896
# 4 11.75 2.740763  5.948083    16.49120
# 5 14.00 3.673714  5.948083    12.09174

## prescribe strokeplane angle:
Paero <- computeFlappingPower(myBird,speedrange,strokeplane=20)
print(Paero[c("speed","power","frequency","strokeplane")])
#   speed    power frequency strokeplane
# 1  5.00 2.950259  5.948083          20
# 2  7.25 2.141581  5.948083          20
# 3  9.50 2.204132  5.948083          20
# 4 11.75 2.741335  5.948083          20
# 5 14.00 3.676224  5.948083          20

## prescribe frequency as a function of speed:
funFrequency = function(U){19.8 - 4.7*U + 0.45*U^2 - 0.0138*U^3}
Paero <- computeFlappingPower(myBird,speedrange,frequency=funFrequency,strokeplane='opt')
print(Paero[c("speed","power","frequency","strokeplane")])
#   speed    power frequency strokeplane
# 1  5.00 2.810431  5.825000    46.16223
# 2  7.25 2.356278  4.119247    25.99702
# 3  9.50 2.390251  3.930725    17.94304
# 4 11.75 2.860463  4.316291    14.52910
# 5 14.00 3.794431  4.332800    11.70058

## examine effect of frequency for a single airspeed:
speedrange <- rep(10,5) #  repeated speed
freqrange <- seq(3,10,length.out=5) #  frequency range
Paero <- computeFlappingPower(myBird,speedrange,frequency=freqrange,strokeplane='opt')
print(Paero[c("speed","power","frequency","strokeplane")])
#   speed    power frequency strokeplane
# 1    10 2.681028      3.00    13.87797
# 2    10 2.367982      4.75    18.90949
# 3    10 2.263765      6.50    21.52433
# 4    10 2.219739      8.25    21.71519
# 5    10 2.200852     10.00    20.18503



