library(afpt)


### Name: findMaximumRangeSpeed
### Title: Find maximum range speed
### Aliases: findMaximumRangeSpeed
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Define a bird:
myBird = Bird(
  massTotal = 0.215, #  (kg) total body mass
  wingSpan = 0.67, #  (m) maximum wing span
  wingArea = 0.0652, #  (m2) maximum wing area
  type = "passerine"
)

maximumRangeSpeed.chem <- findMaximumRangeSpeed(myBird)
maximumRangeSpeed.chem[c('speed','power','strokeplane','amplitude','frequency')]
#      speed    power strokeplane amplitude frequency
# 1 11.02543 14.32754    18.17729  36.69311  5.948083

maximumRangeSpeed.chem.wind <- findMaximumRangeSpeed(
  myBird,
  windSpeed = 5,
  windDir = 90
)
maximumRangeSpeed.chem.wind[c('speed','power','strokeplane','amplitude','frequency')]
#      speed    power strokeplane amplitude frequency
# 1 11.81974 15.47758    16.33727  38.17508  5.948083



