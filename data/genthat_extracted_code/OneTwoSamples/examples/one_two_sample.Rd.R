library(OneTwoSamples)


### Name: one_two_sample
### Title: Deal with one and two (normal) samples
### Aliases: one_two_sample

### ** Examples

## One sample
x=rnorm(10, mean = 1, sd = 0.2); x

## one_sample(x, ...) == one_two_sample(x, ...)
one_sample(x, mu = 1, sigma = 0.2, side = 1)
one_two_sample(x, mu = 1, sigma = 0.2, side = 1)

one_sample(x, sigma = 0.2, side = 1)
one_two_sample(x, sigma = 0.2, side = 1)

one_sample(x, mu = 1, side = 1)
one_two_sample(x, mu = 1, side = 1)

one_sample(x)
one_two_sample(x)

## Two samples
set.seed(1)
x=rnorm(10, mean = 1, sd = 0.2); x
y=rnorm(20, mean = 2, sd = 0.3); y
y2=rnorm(20, mean = 2, sd = 0.2); y2

## sigma1, sigma2 known; mu1, mu2 known
one_two_sample(x, y, sigma = c(0.2, 0.3), mu = c(1, 2))

## sigma1 = sigma2 unknown; mu1, mu2 known
one_two_sample(x, y2, var.equal = TRUE, mu = c(1, 2))

## sigma1 != sigma2 unknown; mu1, mu2 known
one_two_sample(x, y, mu = c(1, 2))

## sigma1, sigma2 known; mu1, mu2 unknown
one_two_sample(x, y, sigma = c(0.2, 0.3))

## sigma1 = sigma2 unknown; mu1, mu2 unknown
one_two_sample(x, y2, var.equal = TRUE)

## sigma1 != sigma2 unknown; mu1, mu2 unknown
one_two_sample(x, y)




