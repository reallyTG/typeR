library(e1071)


### Name: moment
### Title: Statistical Moment
### Aliases: moment
### Keywords: univar

### ** Examples

x <- rnorm(100)

## Compute the mean
moment(x)
## Compute the 2nd centered moment (!= var)
moment(x, order=2, center=TRUE)

## Compute the 3rd absolute centered moment
moment(x, order=3, center=TRUE, absolute=TRUE)



