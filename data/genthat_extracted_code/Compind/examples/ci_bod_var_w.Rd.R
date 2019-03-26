library(Compind)


### Name: ci_bod_var_w
### Title: Variance weighted Benefit of the Doubt approach (BoD variance
###   weighted)
### Aliases: ci_bod_var_w

### ** Examples

i1 <- seq(0.3, 0.5, len = 100) - rnorm (100, 0.2, 0.03)
i2 <- seq(0.3, 1, len = 100)   - rnorm (100, 0.2, 0.03)
Indic = data.frame(i1, i2)
CI = ci_bod_var_w(Indic)




