library(growthrates)


### Name: fit_easylinear
### Title: Fit Exponential Growth Model with a Heuristic Linear Method
### Aliases: fit_easylinear

### ** Examples

data(bactgrowth)

splitted.data <- multisplit(bactgrowth, c("strain", "conc", "replicate"))
dat <- splitted.data[[1]]

plot(value ~ time, data=dat)
fit <- fit_easylinear(dat$time, dat$value)

plot(fit)
plot(fit, log="y")
plot(fit, which="diagnostics")

fitx <- fit_easylinear(dat$time, dat$value, h=8, quota=0.95)

plot(fit, log="y")
lines(fitx, pch="+", col="blue")

plot(fit)
lines(fitx, pch="+", col="blue")





