library(Compind)


### Name: ci_rbod_dir
### Title: Directional Robust Benefit of the Doubt approach (D-RBoD)
### Aliases: ci_rbod_dir

### ** Examples

data(EU_NUTS1)
data_norm = normalise_ci(EU_NUTS1,c(2:3),polarity = c("POS","POS"), method=2)
CI = ci_rbod_dir(data_norm$ci_norm, c(1:2), M = 25, B = 50, c(1,0.1)) 



