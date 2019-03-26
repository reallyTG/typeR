library(BayesMixSurv)


### Name: predict.bayesmixsurv
### Title: Predict method for bayesmixsurv model fits
### Aliases: predict.bayesmixsurv summary.predict.bayesmixsurv
### Keywords: ~kwd1 ~kwd2

### ** Examples

est <- bayesmixsurv(Surv(futime, fustat) ~ ecog.ps + rx + age, ovarian
            , control=bayesmixsurv.control(iter=400, nskip=100))
pred <- predict(est, tvec=50)
predsumm <- summary(pred, idx=1:10)



