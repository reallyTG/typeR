library(CPAT)


### Name: stat_Vn
### Title: Compute the CUSUM Statistic
### Aliases: stat_Vn

### ** Examples

CPAT:::stat_Vn(rnorm(1000))
CPAT:::stat_Vn(rnorm(1000), kn = function(n) {0.1 * n}, tau = 1/2)
CPAT:::stat_Vn(rnorm(1000), use_kernel_var = TRUE, bandwidth = "nw", kernel = "bo")



