library(dynpred)


### Name: CVcindex
### Title: Calculate cross-validated c-index
### Aliases: CVcindex
### Keywords: univar

### ** Examples

data(ova)
# Real thing takes a long time, so on a smaller data set
ova2 <- ova[1:100,]
# Actual c-index
cindex(Surv(tyears,d) ~ Karn + Broders + FIGO + Ascites + Diam, data = ova2)
# Cross-validated c-indices
CVcindex(Surv(tyears,d) ~ Karn + Broders + FIGO + Ascites + Diam, data = ova2)
CVcindex(Surv(tyears,d) ~ Karn + Broders + FIGO + Ascites + Diam, data = ova2,
         type="pair")
## No test: 
CVcindex(Surv(tyears,d) ~ Karn + Broders + FIGO + Ascites + Diam, data = ova2,
         type="fullpairs")
## End(No test)



