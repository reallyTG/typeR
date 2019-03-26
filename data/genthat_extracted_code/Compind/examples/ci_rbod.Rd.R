library(Compind)


### Name: ci_rbod
### Title: Robust Benefit of the Doubt approach (RBoD)
### Aliases: ci_rbod

### ** Examples

i1 <- seq(0.3, 0.5, len = 100) - rnorm (100, 0.2, 0.03)
i2 <- seq(0.3, 1, len = 100)   - rnorm (100, 0.2, 0.03)
Indic = data.frame(i1, i2)
CI = ci_rbod(Indic,B=10)

data(EU_NUTS1)
data_norm = normalise_ci(EU_NUTS1,c(2:3),polarity = c("POS","POS"), method=2)
CI = ci_rbod(data_norm$ci_norm,c(1:2),M=10,B=20)



