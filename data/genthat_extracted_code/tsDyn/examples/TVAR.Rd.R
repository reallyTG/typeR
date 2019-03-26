library(tsDyn)


### Name: TVAR
### Title: Multivariate Threshold Autoregressive model
### Aliases: TVAR OlsTVAR
### Keywords: ts

### ** Examples


data(zeroyld)

tv <- TVAR(zeroyld, lag=2, nthresh=2, thDelay=1, trim=0.1, mTh=1, plot=FALSE)

print(tv)
summary(tv)

# a few useful methods:
plot(tv)
predict(tv)
c(AIC(tv), BIC(tv), logLik(tv))



