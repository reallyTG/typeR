library(Compind)


### Name: ci_bod_constr
### Title: Constrained Benefit of the Doubt approach (BoD)
### Aliases: ci_bod_constr

### ** Examples

i1 <- seq(0.3, 0.5, len = 100) - rnorm (100, 0.2, 0.03)
i2 <- seq(0.3, 1, len = 100)   - rnorm (100, 0.2, 0.03)
Indic = data.frame(i1, i2)
CI = ci_bod_constr(Indic,up_w=1,low_w=0.05)

data(EU_NUTS1)
data_norm = normalise_ci(EU_NUTS1,c(2:3),polarity = c("POS","POS"), method=2)
CI = ci_bod_constr(data_norm$ci_norm,c(1:2),up_w=1,low_w=0.05)



