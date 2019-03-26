library(tsDyn)


### Name: predict.TVAR
### Title: Predict method for objects of class "VAR", "VECM" or "TVAR"
### Aliases: predict.TVAR predict.VAR predict.VECM
### Keywords: regression

### ** Examples


data(barry)
barry_in <- head(barry, -5)
barry_out <- tail(barry, 5)

mod_vecm <- VECM(barry_in, lag=2)
mod_var <- lineVar(barry_in, lag=3)
mod_tvar <- TVAR(barry_in, lag=3, nthresh=1, thDelay=1)

pred_vecm <- predict(mod_vecm)
pred_var  <- predict(mod_var) 
pred_tvar <- predict(mod_tvar)

 
## compare forecasts on a plot
n <- 30
plot(1:n, tail(barry[,1], n), type="l", xlim=c(0,n))
lines((n-5+1):n, pred_var[,1], lty=2, col=2)
lines((n-5+1):n, pred_vecm[,1], lty=2, col=3)
lines((n-5+1):n, pred_tvar[,1], lty=2, col=4) 
legend("bottomright", lty=c(1,2,2,2), col=1:4, legend=c("true", "var", "vecm", "tvar"))

## example for newdata:
all.equal(predict(mod_vecm), predict(mod_vecm, newdata=barry[c(317, 318, 319),]))



