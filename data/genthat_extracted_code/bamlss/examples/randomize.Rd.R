library(bamlss)


### Name: randomize
### Title: Transform Smooth Constructs to Random Effects
### Aliases: randomize
### Keywords: regression smooth

### ** Examples

## Simulate data.
d <- GAMart()

## Create a "bamlss.frame".
bf <- bamlss.frame(num ~ s(x1) + s(x2) + s(x3) + s(lon,lat), data = d)

## Structure of the "s(x1)" smooth.construct.
str(bf$x$mu$smooth.construct[["s(x1)"]])

## Transform.
bf <- randomize(bf)

## New structure adding fixed
## and random effect matrices.
str(bf$x$mu$smooth.construct[["s(x1)"]])



