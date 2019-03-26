library(SPOT)


### Name: wrapFunction
### Title: Function Evaluation Wrapper
### Aliases: wrapFunction

### ** Examples

## example function
branin <- function (x) {  
  y <- (x[2]  - 5.1/(4 * pi^2) * (x[1] ^2) + 5/pi * x[1]  - 6)^2 + 
    10 * (1 - 1/(8 * pi)) * cos(x[1] ) + 10
  y  
}
## vectorize / wrap
braninWrapped <-wrapFunction(branin)
## test original
branin(c(1,2))
branin(c(2,2))
branin(c(2,1))
## test wrapped
braninWrapped(matrix(c(1,2,2,2,2,1),3,2,byrow=TRUE))




