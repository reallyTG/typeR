library(BSGW)


### Name: summary.bsgw
### Title: Summarizing Bayesian Survival Generalized Weibull (BSGW) model
###   fits
### Aliases: summary.bsgw print.summary.bsgw

### ** Examples

library("survival")
data(ovarian)
est <- bsgw(Surv(futime, fustat) ~ ecog.ps + rx, ovarian
            , control=bsgw.control(iter=400, nskip=100))
summary(est, pval=0.1)



