library(cctools)


### Name: cont_conv
### Title: Continuous convolution
### Aliases: cont_conv

### ** Examples

# dummy data with discrete variables
dat <- data.frame(
    F1 = factor(rbinom(10, 4, 0.1), 0:4),
    Z1 = ordered(rbinom(10, 5, 0.5), 0:5),
    Z2 = ordered(rpois(10, 1), 0:10),
    X1 = rnorm(10),
    X2 = rexp(10)
)

pairs(dat)
pairs(expand_as_numeric(dat))  # expanded variables without noise
pairs(cont_conv(dat))          # continuously convoluted data




