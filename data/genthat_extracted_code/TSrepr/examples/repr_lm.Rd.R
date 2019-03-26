library(TSrepr)


### Name: repr_lm
### Title: Regression coefficients from linear model as representation
### Aliases: repr_lm

### ** Examples

# Extracts 24 seasonal regression coefficients from the time series by linear model
repr_lm(rnorm(96), freq = 24, method = "lm")

# Try also robust linear models ("rlm" and "l1")
repr_lm(rnorm(96), freq = 24, method = "rlm")
repr_lm(rnorm(96), freq = 24, method = "l1")




