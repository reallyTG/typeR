library(growthrates)


### Name: plot
### Title: Plot Model Fits
### Aliases: plot plot,nonlinear_fit,missing-method
###   lines,nonlinear_fit-method plot,easylinear_fit,missing-method
###   plot,smooth.spline_fit,missing-method lines,easylinear_fit-method
###   plot,multiple_fits,missing-method

### ** Examples


data(bactgrowth)
splitted.data <- multisplit(bactgrowth, c("strain", "conc", "replicate"))

## get table from single experiment
dat <- splitted.data[["D:0:1"]]

fit1 <- fit_spline(dat$time, dat$value)
plot(fit1, log="y")
plot(fit1)

## derive start parameters from spline fit
p <- coef(fit1)

## subset of first 10 data
first10 <-  dat[1:10, ]
fit2 <- fit_growthmodel(grow_exponential, p=p, time=first10$time, y=first10$value)

p <- c(coef(fit1), K = max(dat$value))
fit3 <- fit_growthmodel(grow_logistic, p=p, time=dat$time, y=dat$value, transform="log")

plot(fit1)
lines(fit2, col="green")
lines(fit3, col="red")


all.fits <- all_splines(value ~ time | strain + conc + replicate, data = bactgrowth)
par(mfrow=c(3,3))
plot(all.fits)

## it is also possible to plot a single fit or a subset of the fits
par(mfrow=c(1,1))
plot(all.fits[["D:0:1"]])
par(mfrow=c(2,2))
plot(all.fits[1:4])

## plot only the 'R' strain
par(mfrow=c(4, 6))
plot(all.fits[grep("R:", names(all.fits))])




