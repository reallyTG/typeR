library(nlts)


### Name: prediction.profile.ll
### Title: Nonlinear forecasting at varying lags using local polynomial
###   regression.
### Aliases: prediction.profile.ll print.ppll
### Keywords: ts

### ** Examples


   data(plodia)

     fit <- prediction.profile.ll(sqrt(plodia), step=1:3, order=1:3,
          bandwidth = seq(0.5, 1.5, by = 0.5))

    ## Not run: plot(fit)



