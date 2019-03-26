library(Compind)


### Name: ci_wroclaw
### Title: Wroclaw Taxonomic Method
### Aliases: ci_wroclaw

### ** Examples

i1 <- seq(0.3, 0.5, len = 100) - rnorm (100, 0.2, 0.03)
i2 <- seq(0.3, 1, len = 100)   - rnorm (100, 0.2, 0.03)
Indic = data.frame(i1, i2)
CI = ci_wroclaw(Indic)

data(EU_NUTS1)
CI = ci_wroclaw(EU_NUTS1,c(2:3))

data(EU_2020)
data_selez = EU_2020[,c(1,22,191)]
data_norm = normalise_ci(data_selez,c(2:3),c("POS","NEG"),method=3)
ci_wroclaw(data_norm$ci_norm,c(1:2))




