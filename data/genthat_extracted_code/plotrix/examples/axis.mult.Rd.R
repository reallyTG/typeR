library(plotrix)


### Name: axis.mult
### Title: Display an axis with values having a multiplier
### Aliases: axis.mult
### Keywords: misc

### ** Examples

 plot(1:10 * 0.001, 1:10 * 100,axes = FALSE, xlab = "", ylab = "",
  main = "Axis multipliers")
 box()
 axis.mult(1, mult = 0.001)
 axis.mult(2, mult = 100)



