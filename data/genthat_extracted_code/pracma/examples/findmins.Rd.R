library(pracma)


### Name: findmins
### Title: Find All Minima
### Aliases: findmins
### Keywords: optimize

### ** Examples

fun <- function(x) x * cos(0.1*exp(x)) * sin(0.1*pi*exp(x))
## Not run: ezplot(fun, 0, 5, n = 1001)

# If n is smaller, the rightmost minimum will not be found.
findmins(fun, 0, 5, n= 1000)
#  2.537727 3.248481 3.761840 4.023021 4.295831
#  4.455115 4.641481 4.756263 4.897461 4.987802



