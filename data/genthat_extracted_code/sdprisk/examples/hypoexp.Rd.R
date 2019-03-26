library(sdprisk)


### Name: hypoexp
### Title: Hypo-Exponential Distribution
### Aliases: phypoexp dhypoexp rhypoexp qhypoexp mgfhypoexp
### Keywords: datagen distribution univar

### ** Examples

## Random generation
rhypoexp(10, c(3, 5))

## Mean
mu <- mgfhypoexp(0, c(3, 5), difforder = 1)

## Variance
mgfhypoexp(0, c(3, 5), difforder = 2) - mu^2

## Quantile
qhypoexp(0.5, c(3, 5))



