library(tsDyn)


### Name: predict_rolling
### Title: Rolling forecasts
### Aliases: predict_rolling predict_rolling.nlVar
### Keywords: predict

### ** Examples



data(barry)

## model estimated on full sample:
mod_vec <- VECM(barry, lag=2)

## generate 10 1-step-ahead forecasts:
preds_roll <- predict_rolling(mod_vec, nroll=10)

## plot the results:
plot(window(barry[,"dolcan"],start=1998), type="l", ylab="barry: dolcan")
preds_roll_ts <- ts(preds_roll$pred, start=time(barry)[nrow(barry)-10], freq=12)
lines(preds_roll_ts[,"dolcan"], col=2, lty=2)
legend("bottomright", lty=c(1,2), col=1:2, leg=c("True", "Fitted"))
title("Comparison of true and rolling 1-ahead forecasts\n")





