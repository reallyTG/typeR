library(RadioSonde)


### Name: skewt.points
### Title: Overlays data on a SKEW-T, log p axis
### Aliases: skewt.points
### Keywords: aplot

### ** Examples

# draw a background, then
#    draw the temperature (with a solid line) in color 6
#    draw the dewpoint in color 7
#    overlay the temperature observations in a different color
#    you get the point ...
data(ExampleSonde)
skewt.axis()
skewt.lines( ExampleSonde$temp,  ExampleSonde$press, col = 6)
skewt.lines( ExampleSonde$dewpt, ExampleSonde$press, col = 7)
skewt.points(ExampleSonde$temp,  ExampleSonde$press, col = 3)
skewt.points(ExampleSonde$dewpt, ExampleSonde$press, col = 4)



