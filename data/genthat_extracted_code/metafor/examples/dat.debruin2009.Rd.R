library(metafor)


### Name: dat.debruin2009
### Title: Studies on Standard Care Quality and HAART-Adherence
### Aliases: dat.debruin2009
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.debruin2009))

### calculate proportions and corresponding sampling variances
dat <- escalc(measure="PR", xi=xi, ni=ni, data=dat)

### random-effects model
res <- rma(yi, vi, data=dat)
print(res, digits=2)

### mixed-effects meta-regression model with all predictors/covariates
res <- rma(yi, vi, mods = ~ scq + ethnicity + patients + select + sens, data=dat)
print(res, digits=3)

### mixed-effects meta-regression model with scq and ethnicity as predictors/covariates
res <- rma(yi, vi, mods = ~ scq + ethnicity, data=dat)
print(res, digits=3)



