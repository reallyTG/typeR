library(itertools2)


### Name: itabulate
### Title: Iterator that maps a function to a sequence of numeric values
### Aliases: itabulate

### ** Examples

it <- itabulate(f=function(x) x + 1)
take(it, 4) # 2 3 4 5

it2 <- itabulate(f=function(x) x^2, start=-3)
take(it2, 6) # 9 4 1 0 1 4

it3 <- itabulate(abs, start=-5, step=2)
take(it3, 6) # 5 3 1 1 3 5

it4 <- itabulate(exp, start=6, step=-2)
take(it4, 4) # exp(c(6, 4, 2, 0))



