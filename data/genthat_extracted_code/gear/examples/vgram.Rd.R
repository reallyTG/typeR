library(gear)


### Name: vgram
### Title: Sample semivariogram
### Aliases: vgram

### ** Examples

data(co)
v = vgram(Al ~ 1, co, ~ easting + northing)
plot(v)
v2 = vgram(Al ~ 1, co, ~ easting + northing, angle = 22.5, ndir = 4)
plot(v2)



