library(mpr)


### Name: predict.mpr
### Title: Predict method for Multi-Parameter Regression (MPR) Fits
### Aliases: predict.mpr

### ** Examples

library(survival)

# Veterans' administration lung cancer data
data(veteran)
head(veteran)

# Weibull MPR treatment model
mod1 <- mpr(Surv(time, status) ~ list(~ trt, ~ trt), data=veteran,
            family="Weibull")

# predicted survivor function evaluated at four times
predict(mod1, newdata=data.frame(trt=c(1,2)), type="survivor",
        tvec=c(25, 50, 100, 150))

# predicted percentiles
predict(mod1, newdata=data.frame(trt=c(1,2)), type="percentile", prob=0.5)
predict(mod1, newdata=data.frame(trt=c(1,2)), type="percentile", prob=0.1)

# comparing predicted survivor functions to Kaplan-Meier curves
KM <- survfit(Surv(time, status) ~ trt, data=veteran)
plot(KM, col=1:2)
tvec <- seq(0, max(KM$time), length=100)
Stpred <- predict(mod1, newdata=data.frame(trt=c(1,2)), type="survivor",
                  tvec=tvec)
lines(tvec, Stpred[1,])
lines(tvec, Stpred[2,], col=2)



