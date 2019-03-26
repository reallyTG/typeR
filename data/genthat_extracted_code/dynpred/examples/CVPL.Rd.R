library(dynpred)


### Name: CVPL
### Title: Calculate cross-validated log-partial likelihood (with
###   shrinkage)
### Aliases: CVPL
### Keywords: univar

### ** Examples

data(ova)
CVPL(Surv(tyears, d) ~ 1, data = ova)
CVPL(Surv(tyears, d) ~ Karn + Broders + FIGO + Ascites + Diam,
  data = ova)
CVPL(Surv(tyears, d) ~ Karn + Broders + FIGO + Ascites + Diam,
  data = ova, overall=TRUE)



