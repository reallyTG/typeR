library(RadioSonde)


### Name: skewt.axis
### Title: Draws a SKEW-T, log p axis.
### Aliases: skewt.axis
### Keywords: hplot

### ** Examples

# draw a background, then
#    draw the temperature (with a solid line) in color 6
#    draw the dewpoint in color 7
#    overlay the temperature observations in a different color
#    you get the point ...
#
data(ExampleSonde)
skewt.axis( mar=c(5.1, 1.1, 2.1, 5.1) )
skewt.lines( ExampleSonde$temp,  ExampleSonde$press, col = 6)
skewt.lines( ExampleSonde$dewpt, ExampleSonde$press, col = 7)
skewt.points(ExampleSonde$temp,  ExampleSonde$press, col = 3)
skewt.points(ExampleSonde$dewpt, ExampleSonde$press, col = 4)
#
# Changing the moist adiabats: you must edit the \code{skewt.axis} function
# directly and then capture the output in \code{skewt.data} to be used in 
# subsequent calls.
skewt.data <- skewt.axis(redo=TRUE)
skewt.axis() 
skewt.axis() 



