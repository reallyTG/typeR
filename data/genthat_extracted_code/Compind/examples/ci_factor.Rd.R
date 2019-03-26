library(Compind)


### Name: ci_factor
### Title: Weighting method based on Factor Analysis
### Aliases: ci_factor

### ** Examples

i1 <- seq(0.3, 0.5, len = 100) - rnorm (100, 0.2, 0.03)
i2 <- seq(0.3, 1, len = 100)   - rnorm (100, 0.2, 0.03)
Indic = data.frame(i1, i2)
CI = ci_factor(Indic)

data(EU_NUTS1)
CI = ci_factor(EU_NUTS1,c(2:3), method="ALL")

data(EU_2020)
data_norm = normalise_ci(EU_2020,c(47:51),polarity = c("POS","POS","POS","POS","POS"), method=2)
CI3 = ci_factor(data_norm$ci_norm,c(1:5),method="CH", dim=3)



