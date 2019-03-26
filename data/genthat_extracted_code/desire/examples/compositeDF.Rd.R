library(desire)


### Name: compositeDF
### Title: Construct composite desirability functions
### Aliases: compositeDF compositeDF.call compositeDF.function
###   compositeDF.lm
### Keywords: optimize multivariate

### ** Examples

h <- harrington2(-1, 1, 1)
## Calculate h(x^2):
ch1 <- compositeDF(x^2, h)
ch1(0.5)
ch1(c(0.2,0.5,0.7))

## Calculate h(f(x))
f <- function(x) 2*x + 3
ch2 <- compositeDF(f, h)
ch2(0.3)
ch2(c(0.3,0.35,0.9))



