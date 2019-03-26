library(dynpred)


### Name: cindex
### Title: Calculate Harrell's c-index
### Aliases: cindex
### Keywords: univar

### ** Examples

data(ova)
cindex(Surv(tyears, d) ~ Karn + Broders + FIGO + Ascites + Diam, data = ova)



