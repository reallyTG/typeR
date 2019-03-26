library(growthrates)


### Name: predict,growthrates_fit-method
### Title: Model Predictions for 'growthrates' Fits
### Aliases: predict,growthrates_fit-method
###   predict,smooth.spline_fit-method predict,nonlinear_fit-method
###   predict,multiple_fits-method

### ** Examples


data(bactgrowth)
splitted.data <- multisplit(bactgrowth, c("strain", "conc", "replicate"))

## get table from single experiment
dat <- splitted.data[["T:0:2"]]

fit1 <- fit_spline(dat$time, dat$value, spar=0.5)
coef(fit1)
summary(fit1)

p   <- c(y0 = 0.02, mumax = .5, K = 0.05, h0 = 1)
fit2 <- fit_growthmodel(grow_baranyi, p=p, time=dat$time, y=dat$value)

## prediction for given data
predict(fit2)

## prediction for new data
pr <- predict(fit2, newdata=data.frame(time=seq(0, 50, 0.1)))

plot(fit2, xlim=c(0, 50))
lines(pr[, c("time", "y")], lty="dashed", col="red")



