library(capn)


### Name: aproxdef
### Title: Defining Approximation Space
### Aliases: aproxdef

### ** Examples

## Reef-fish example: see Fenichel and Abbott (2014)
delta <- 0.02
upper <- 359016000     # upper bound on approximation space
lower <- 5*10^6        # lower bound on approximation space
myspace <- aproxdef(50,lower,upper,delta)
## Two dimensional example
ub <- c(1.5,1.5)
lb <- c(0.1,0.1)
deg <- c(20,20)
delta <- 0.03
myspace <- aproxdef(deg,lb,ub,delta)



