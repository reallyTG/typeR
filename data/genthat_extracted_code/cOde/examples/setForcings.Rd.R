library(cOde)


### Name: setForcings
### Title: Generate interpolation spline for the forcings and write into
###   list of matrices
### Aliases: setForcings

### ** Examples

f <- c(x = "-k*x + a - b")
func <- funC(f, forcings = c("a", "b"))
forcData <- rbind(
  data.frame(name = "a", time = c(0, 1, 10), value = c(0, 5, 2)),
  data.frame(name = "b", time = c(0, 5, 10), value = c(1, 3, 6)))
forc <- setForcings(func, forcData) 



