library(tsxtreme)


### Name: Laplace
### Title: The Laplace Distribution
### Aliases: dlapl plapl qlapl rlapl
### Keywords: datagen distribution

### ** Examples

## evaluate the density function on a grid of values
x  <- seq(from=-5, to=5, by=0.1)
fx <- dlapl(x, loc=1, scale=.5)

## generate random samples of a mixture of Laplace distributions
rnd <- rlapl(1000, loc=c(-5,-3,2), scale=0.5)

## an alternative:
rnd <- runif(1000)
rnd <- qlapl(rnd, loc=c(-5,-3,2), scale=0.5)

## integrate the Laplace density on [a,b]
a <- -1
b <- 7
integral <- plapl(b)-plapl(a)



