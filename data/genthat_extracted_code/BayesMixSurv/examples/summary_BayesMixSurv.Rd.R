library(BayesMixSurv)


### Name: summary.bayesmixsurv
### Title: Summarizing BayesMixSurv model fits
### Aliases: summary.bayesmixsurv print.summary.bayesmixsurv
### Keywords: ~kwd1 ~kwd2

### ** Examples

est <- bayesmixsurv(Surv(futime, fustat) ~ ecog.ps + rx, ovarian
            , control=bayesmixsurv.control(iter=800, nskip=100))
summary(est, pval=0.1)



