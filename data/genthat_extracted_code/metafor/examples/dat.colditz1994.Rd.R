library(metafor)


### Name: dat.colditz1994
### Title: Studies on the Effectiveness of the BCG Vaccine Against
###   Tuberculosis
### Aliases: dat.colditz1994 dat.bcg
### Keywords: datasets

### ** Examples

### load BCG vaccine data
dat <- get(data(dat.bcg))

### calculate log risk ratios and corresponding sampling variances
dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)
dat

### random-effects model
res <- rma(yi, vi, data=dat)
res

### average risk ratio with 95% CI
predict(res, transf=exp)

### mixed-effects model with absolute latitude and publication year as moderators
res <- rma(yi, vi, mods = ~ ablat + year, data=dat)
res

### predicted average risk ratios for 10-60 degrees absolute latitude
### holding the publication year constant at 1970
predict(res, newmods=cbind(seq(from=10, to=60, by=10), 1970), transf=exp)

### note: the interpretation of the results is difficult because absolute
### latitude and publication year are strongly correlated (the more recent
### studies were conducted closer to the equator)
plot(dat$ablat, dat$year)
cor(dat$ablat, dat$year)



