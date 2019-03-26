library(growthrates)


### Name: rsquared,growthrates_fit-method
### Title: Accessor Methods of Package 'growthrates'.
### Aliases: rsquared,growthrates_fit-method obs,growthrates_fit-method
###   coef,growthrates_fit-method coef,easylinear_fit-method
###   coef,smooth.spline_fit-method deviance,growthrates_fit-method
###   summary,growthrates_fit-method summary,nonlinear_fit-method
###   residuals,growthrates_fit-method df.residual,growthrates_fit-method
###   summary,smooth.spline_fit-method df.residual,smooth.spline_fit-method
###   deviance,smooth.spline_fit-method coef,multiple_fits-method
###   rsquared,multiple_fits-method deviance,multiple_fits-method
###   results,multiple_fits-method results,multiple_easylinear_fits-method
###   summary,multiple_fits-method residuals,multiple_fits-method

### ** Examples


data(bactgrowth)
splitted.data <- multisplit(bactgrowth, c("strain", "conc", "replicate"))

## get table from single experiment
dat <- splitted.data[[10]]

fit1 <- fit_spline(dat$time, dat$value, spar=0.5)
coef(fit1)
summary(fit1)

## derive start parameters from spline fit
p <- c(coef(fit1), K = max(dat$value))
fit2 <- fit_growthmodel(grow_logistic, p=p, time=dat$time, y=dat$value, transform="log")
coef(fit2)
rsquared(fit2)
deviance(fit2)

summary(fit2)

plot(residuals(fit2) ~ obs(fit2)[,2])





