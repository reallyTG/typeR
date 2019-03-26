library(dynpred)


### Name: pew
### Title: Calculate dynamic prediction error curve
### Aliases: pew pewcox
### Keywords: univar

### ** Examples

data(ova)
# Example on a subset, because the effect of CV is clearer
ova2 <- ova[1:100,]
pewcox(Surv(tyears, d) ~ Karn + Broders + FIGO + Ascites + Diam, Surv(tyears, 1-d) ~ 1,
  width=2, data = ova2, FUN="Brier", tout=seq(0,6,by=0.5))
pewcox(Surv(tyears, d) ~ Karn + Broders + FIGO + Ascites + Diam, Surv(tyears, 1-d) ~ 1,
  width=2, data = ova2, FUN="Brier", tout=seq(0,6,by=0.5), CV=TRUE, progress=TRUE)

## No test: 
pewcox(Surv(tyears, d) ~ Karn + Broders + FIGO + Ascites + Diam, Surv(tyears, 1-d) ~ 1,
  width=2, data = ova, FUN="Brier", tout=seq(0,6,by=0.5))
pewcox(Surv(tyears, d) ~ Karn + Broders + FIGO + Ascites + Diam, Surv(tyears, 1-d) ~ 1,
  width=2, data = ova, FUN="Brier", tout=seq(0,6,by=0.5), CV=TRUE, progress=TRUE)
## End(No test)



