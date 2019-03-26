library(cctools)


### Name: expand_as_numeric
### Title: Numeric model matrix for continuous convolution
### Aliases: expand_as_numeric

### ** Examples

# dummy data with discrete variables
dat <- data.frame(
    F1 = factor(rbinom(100, 4, 0.1), 0:4),
    Z1 = as.ordered(rbinom(100, 5, 0.5)),
    Z2 = as.ordered(rpois(100, 1)),
    X1 = rnorm(100),
    X2 = rexp(100)
)

pairs(dat)
pairs(expand_as_numeric(dat))  # expanded variables without noise
pairs(cont_conv(dat))          # continuously convoluted data




