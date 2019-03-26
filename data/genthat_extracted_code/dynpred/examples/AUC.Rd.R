library(dynpred)


### Name: AUC
### Title: Calculate AUC(t) curve
### Aliases: AUC
### Keywords: univar

### ** Examples

data(ova)
AUC(Surv(tyears, d) ~ Karn + Broders + FIGO + Ascites + Diam, data = ova)



