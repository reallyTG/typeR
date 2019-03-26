library(dispRity)


### Name: random.circle
### Title: Random circle
### Aliases: random.circle

### ** Examples

## A simple uniform circle
plot(random.circle(1000, runif), pch = 20)

## A normal ring with inner and outer boundaries
plot(random.circle(1000, rnorm, inner = 0.5, outer = 5), pch = 20)




