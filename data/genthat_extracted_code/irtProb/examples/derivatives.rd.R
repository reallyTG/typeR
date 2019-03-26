library(irtProb)


### Name: derivatives
### Title: First and Second Derivatives
### Aliases: fprime fsecond
### Keywords: math

### ** Examples

## .....................................
 test  <- function(x) 2*x+5
  test(   x=0)
  fprime( x=0, FUN=test)
  fsecond(x=0, FUN=test)
## .....................................
 test2 <- function(x) 2*(x[1]*x[2])+5
  test2(  x=c(0,0))
  fprime( x=c(0,0), FUN=test2)
  fsecond(x=c(0,0), FUN=test2)
 


