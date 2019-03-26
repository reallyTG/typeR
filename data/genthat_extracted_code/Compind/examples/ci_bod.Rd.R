library(Compind)


### Name: ci_bod
### Title: Benefit of the Doubt approach (BoD)
### Aliases: ci_bod

### ** Examples

i1 <- seq(0.3, 0.5, len = 100) - rnorm (100, 0.2, 0.03)
i2 <- seq(0.3, 1, len = 100)   - rnorm (100, 0.2, 0.03)
Indic = data.frame(i1, i2)
CI = ci_bod(Indic)
 # validating BoD score
w = CI$ci_bod_weights
Indic[,1]*w[,1] + Indic[,2]*w[,2]


data(EU_NUTS1)
data_norm = normalise_ci(EU_NUTS1,c(2:3),polarity = c("POS","POS"), method=2)
CI = ci_bod(data_norm$ci_norm,c(1:2))



