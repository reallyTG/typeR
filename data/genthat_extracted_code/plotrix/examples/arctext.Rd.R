library(plotrix)


### Name: arctext
### Title: Display text on a circular arc
### Aliases: arctext
### Keywords: misc

### ** Examples

 plot(0, xlim = c(1, 5),ylim = c(1, 5),main = "Test of arctext", xlab = "",
  ylab = "", type = "n")
 arctext("bendy like spaghetti", center = c(3,3), col = "blue")
 arctext("bendy like spaghetti", center = c(3,3), radius = 1.5, start = pi,
  cex = 2)
 arctext("bendy like spaghetti", center = c(3, 3),radius = 0.5,
  start = pi/2, stretch = 1.2)
 arctext("bendy like spaghetti", center = c(3, 3), radius = 1.7,
  start = 4 * pi / 3, cex = 1.3, clockwise = FALSE)



