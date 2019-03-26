library(SEL)


### Name: predict.SEL
### Title: Evaluate the expert's density (or cdf)
### Aliases: predict.SEL
### Keywords: misc

### ** Examples

# example from O'Hagan et al. (2006)
x <- c(177.5, 183.75, 190, 205, 220)
y <- c(0.175, 0.33, 0.5, 0.75, 0.95)

default   <- SEL(x, y, Delta = 0.05, bounds = c(165, 250))
predict(default, newdata = c(200, 205))



