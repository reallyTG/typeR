library(Compind)


### Name: ci_generalized_mean
### Title: Weighting method based on generalized mean
### Aliases: ci_generalized_mean

### ** Examples

i1 <- seq(0.3, 0.5, len = 100) - rnorm (100, 0.2, 0.03)
i2 <- seq(0.3, 1, len = 100)   - rnorm (100, 0.2, 0.03)
Indic = data.frame(i1, i2)
CI = ci_generalized_mean(Indic, p=-1) # harmonic mean

data(EU_NUTS1)
CI = ci_generalized_mean(EU_NUTS1,c(2:3),p=2) # geometric mean



