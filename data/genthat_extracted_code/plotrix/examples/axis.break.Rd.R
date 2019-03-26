library(plotrix)


### Name: axis.break
### Title: Place a "break" mark on an axis
### Aliases: axis.break
### Keywords: misc

### ** Examples

 plot(3:10, main = "Axis break test")
 # put a break at the default axis and position
 axis.break()
 axis.break(2, 2.9, style = "zigzag")
 twogrp <- c(rnorm(10) + 4, rnorm(10) + 20)
 gap.plot(twogrp,gap = c(8,16), xlab = "Index", ylab = "Group values",
  main = "Two separated groups with gap axis break",
  col = c(rep(2, 10), rep(3, 10)), ytics = c(3, 5, 18, 20))
 legend(12, 6, c("Low group", "High group"), pch = 1, col = 2:3)



