library(CPAT)


### Name: stat_de
### Title: Compute the Darling-Erdös Statistic
### Aliases: stat_de

### ** Examples

CPAT:::stat_de(rnorm(1000))
CPAT:::stat_de(rnorm(1000), use_kernel_var = TRUE, bandwidth = "nw", kernel = "bo")



