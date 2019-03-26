library(Compind)


### Name: ci_bod_dir
### Title: Directional Benefit of the Doubt (D-BoD) model
### Aliases: ci_bod_dir

### ** Examples

i1 <- seq(0.3, 0.5, len = 100) - rnorm (100, 0.2, 0.03)
i2 <- seq(0.3, 1, len = 100)   - rnorm (100, 0.2, 0.03)
Indic = data.frame(i1, i2)
CI = ci_bod_dir(Indic,dir=c(1,1))

data(EU_NUTS1)
data_norm = normalise_ci(EU_NUTS1,c(2:3),polarity = c("POS","POS"), method=2)
CI = ci_bod_dir(data_norm$ci_norm,c(1:2),dir=c(1,0.5))



