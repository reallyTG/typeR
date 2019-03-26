library(dynpred)


### Name: pe
### Title: Calculate prediction error curve
### Aliases: pe pecox
### Keywords: univar

### ** Examples

data(ova)
# Example on a subset, because the effect of CV is clearer
ova2 <- ova[1:100,]
pecox(Surv(tyears, d) ~ Karn + Broders + FIGO + Ascites + Diam, Surv(tyears, 1-d) ~ 1,
  data = ova2, FUN="Brier", tout=seq(0,6,by=0.5))
pecox(Surv(tyears, d) ~ Karn + Broders + FIGO + Ascites + Diam, Surv(tyears, 1-d) ~ 1,
  data = ova2, FUN="Brier", tout=seq(0,6,by=0.5), CV=TRUE, progress=TRUE)

## No test: 
pecox(Surv(tyears, d) ~ Karn + Broders + FIGO + Ascites + Diam, Surv(tyears, 1-d) ~ 1,
  data = ova, FUN="Brier", tout=seq(0,6,by=0.5))
pecox(Surv(tyears, d) ~ Karn + Broders + FIGO + Ascites + Diam, Surv(tyears, 1-d) ~ 1,
  data = ova, FUN="Brier", tout=seq(0,6,by=0.5), CV=TRUE, progress=TRUE)
## End(No test)



