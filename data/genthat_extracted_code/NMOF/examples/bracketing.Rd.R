library(NMOF)


### Name: bracketing
### Title: Zero-Bracketing
### Aliases: bracketing
### Keywords: optimize

### ** Examples

## Gilli/Maringer/Schumann (2011), p. 290
testFun <- function(x)
    cos(1/x^2)

bracketing(testFun, interval = c(0.3, 0.9), n = 26L)
bracketing(testFun, interval = c(0.3, 0.9), n = 26L, method = "vectorised")



