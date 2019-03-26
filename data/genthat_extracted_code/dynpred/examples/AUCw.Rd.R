library(dynpred)


### Name: AUCw
### Title: Calculate dynamic AUC(t) curve
### Aliases: AUCw
### Keywords: univar

### ** Examples

data(ova)
AUCw(Surv(tyears, d) ~ Karn + Broders + FIGO + Ascites + Diam, data = ova,
  width = 2)



