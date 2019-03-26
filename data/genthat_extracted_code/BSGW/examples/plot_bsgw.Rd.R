library(BSGW)


### Name: plot.bsgw
### Title: Plot diagnostics for a bsgw object
### Aliases: plot.bsgw

### ** Examples

library("survival")
data(ovarian)
est <- bsgw(Surv(futime, fustat) ~ ecog.ps + rx, ovarian
            , control=bsgw.control(iter=400, nskip=100))
plot(est)



