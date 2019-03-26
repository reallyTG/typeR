library(EngrExpt)


### Name: timetemp
### Title: Time to nominal temperature
### Aliases: timetemp
### Keywords: datasets

### ** Examples

str(timetemp)
xyplot(time ~ temp, timetemp, groups = type,
       type = c("g","p","r"), aspect = 'xy',
       ylab = "Time to reach -10C (min.)",
       xlab = "Temperature in freezer (degrees C)",
       auto.key = list(columns = 2, lines = TRUE))



