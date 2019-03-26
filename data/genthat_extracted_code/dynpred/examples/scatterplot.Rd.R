library(dynpred)


### Name: scatterplot
### Title: Create scatter plot with imputed survival times
### Aliases: scatterplot
### Keywords: univar

### ** Examples

data(ova)
scatterplot(Surv(tyears, d) ~ Karn + Broders + FIGO + Ascites + Diam, data = ova)



