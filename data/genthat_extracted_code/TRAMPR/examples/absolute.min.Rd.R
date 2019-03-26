library(TRAMPR)


### Name: absolute.min
### Title: Absolute Minimum
### Aliases: absolute.min
### Keywords: utilities internal univar arith

### ** Examples

set.seed(1)
x <- rnorm(16)
min(x)          # -2.2147
min(abs(x))     #  0.0444
absolute.min(x) # -0.0444: preserves sign

# NA values OK:
absolute.min(c(-1, 4, NA))

# Slightly unintuitive behaviour:
absolute.min(numeric(0)) # numeric(0)
absolute.min(NA)         # NA



