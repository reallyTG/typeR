library(cmna)


### Name: simp
### Title: Simpson's rule
### Aliases: simp

### ** Examples

f <- function(x) { sin(x)^2 + cos(x)^2 }
simp(f, -pi, pi, m = 10)
simp(f, -pi, pi, m = 100)
simp(f, -pi, pi, m = 1000)




