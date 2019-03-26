library(timeDate)


### Name: plot-methods
### Title: Plot Methods
### Aliases: plot,timeDate-method points,timeDate-method
###   lines,timeDate-method abline,ANY,ANY,ANY,timeDate-method
###   axis.timeDate pretty.timeDate
### Keywords: hplot chron

### ** Examples

## timeCalendar -
   x <- timeCalendar()
   y <- rnorm(12)


## Plotting :

   plot(x, y, type = "l")
   points(x, y, pch = 19, col = "red")

   plot(x, y, type = "l", xaxt = "n")
   axis.timeDate(1, at = x[c(1, 3, 5, 7, 9, 11)], format = "%b")
   axis.timeDate(1, at = x[12], format = "%Y")



