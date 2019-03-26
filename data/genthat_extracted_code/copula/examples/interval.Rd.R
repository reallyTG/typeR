library(copula)


### Name: interval
### Title: Construct Simple "interval" Object
### Aliases: interval
### Keywords: arith utilities

### ** Examples

interval("[0, 1)")

## Two ways to specify open interval borders:
identical(interval("]-1,1["),
          interval("(-1,1)"))

## infinite :
interval("[0, Inf)")

## arithmetic with scalars works:
4 + 2 * interval("[0, 1.5)") # ->  [4, 7)

## str() to look at internals:
str( interval("[1.2, 7]") )



