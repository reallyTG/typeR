library(BSGW)


### Name: bsgw
### Title: Bayesian Survival using Generalized Weibull Regression
### Aliases: BSGW bsgw print.bsgw bsgw.control

### ** Examples

## model estimation using 800 samples, printing progress every 100 samples
library("survival")
data(ovarian)
est <- bsgw(Surv(futime, fustat) ~ ecog.ps + rx, ovarian
            , control=bsgw.control(iter=400, nskip=100))

## comparing shape of Weibull curves between ordinary Weibull and bsgw
## since in bsgw shape is dependent on covariates, only a population average is meaningful
## Note that survreg-style scale is inverse of bsgw shape parameter, see survreg help page
west <- survreg(Surv(futime, fustat) ~ ecog.ps + rx, ovarian)
cat("constant survreg-style scale parameter:", west$scale, "\n")
cat("population average of survreg-style scale parameter from bsgw model:"
  , mean(est$median$survreg.scale), "\n")



