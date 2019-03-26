library(EMMAgeo)


### Name: define.limits
### Title: Define mode limits by mouse clicks.
### Aliases: define.limits
### Keywords: EMMA

### ** Examples

## load example data set
data(X, envir = environment())

## Test robustness
q <- 4:7
l <- seq(from = 0, to = 0.1, by = 0.02)
TR <- test.robustness(X = X, q = q, l = l)

## define 2 limits by mouse clicks (uncomment to use).
# limits <- define.limits(data = TR, n = 2)
# limits



