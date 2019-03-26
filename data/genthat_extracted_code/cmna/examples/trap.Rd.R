library(cmna)


### Name: trap
### Title: Trapezoid method
### Aliases: trap

### ** Examples

f <- function(x) { sin(x)^2 + cos(x)^2 }
trap(f, -pi, pi, m = 10)
trap(f, -pi, pi, m = 100)
trap(f, -pi, pi, m = 1000)




