library(BayesMixSurv)


### Name: plot.bayesmixsurv
### Title: Plot diagnostics for a bayesmixsurv object
### Aliases: plot.bayesmixsurv
### Keywords: ~kwd1 ~kwd2

### ** Examples

est <- bayesmixsurv(Surv(futime, fustat) ~ ecog.ps + rx, ovarian
            , control=bayesmixsurv.control(iter=800, nskip=100))
plot(est)



