library(GoFKernel)


### Name: area.between
### Title: Area between a Density Function and a Kernel Estimate
### Aliases: area.between
### Keywords: density

### ** Examples

## Unbounded example
x <- rnorm(100)
dx <- density(x)
area.between(dnorm, dx)

## Bounded example
x <- rbeta(100, 1.3, 2)
dx <- density.reflected(x, lower=0, upper=1)
area.between(dunif, dx)



