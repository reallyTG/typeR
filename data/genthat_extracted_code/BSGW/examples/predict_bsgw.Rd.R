library(BSGW)


### Name: predict.bsgw
### Title: Predict method for bsgw model fits
### Aliases: predict.bsgw summary.predict.bsgw

### ** Examples

library("survival")
data(ovarian)
est <- bsgw(Surv(futime, fustat) ~ ecog.ps + rx, ovarian
            , control=bsgw.control(iter=400, nskip=100))
pred <- predict(est, tvec=100)
predsumm <- summary(pred, idx=1:10)



