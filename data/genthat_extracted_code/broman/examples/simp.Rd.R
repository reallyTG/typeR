library(broman)


### Name: simp
### Title: Numerical integration
### Aliases: simp trap
### Keywords: math

### ** Examples

f <- function(x) x*x*(1-x)*sin(x*x)
I1 <- trap(f,0,2)
I2 <- simp(f,0,2)




