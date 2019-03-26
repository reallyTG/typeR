library(fractional)


### Name: vfractional
### Title: Vectorized form for fractional
### Aliases: vfractional

### ** Examples

oldOpt <- options(scipen = 15)
pi_approx <- vfractional(base::pi, eps = 0, maxConv = 1:10)
within(data.frame(pi_approx, stringsAsFactors = FALSE), {
  value = numerical(pi_approx)
  error = signif(base::pi - value, 3)
  n = seq_along(value) - 1
})[, c("n", "pi_approx", "value", "error")]
options(oldOpt)



