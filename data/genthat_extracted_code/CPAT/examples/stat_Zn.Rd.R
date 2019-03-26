library(CPAT)


### Name: stat_Zn
### Title: Compute the Rényi-Type Statistic
### Aliases: stat_Zn

### ** Examples

CPAT:::stat_Zn(rnorm(1000))
CPAT:::stat_Zn(rnorm(1000), kn = function(n) {floor(log(n))})
CPAT:::stat_Zn(rnorm(1000), use_kernel_var = TRUE, bandwidth = "nw",
               kernel = "bo")



