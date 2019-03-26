library(metafor)


### Name: profile.rma.uni
### Title: Profile Plots for 'rma' Objects
### Aliases: profile.rma.uni profile.rma.mv plot.profile.rma
### Keywords: hplot

### ** Examples

### calculate log odds ratios and corresponding sampling variances
dat <- escalc(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)

### random-effects model using rma.uni()
res <- rma(yi, vi, data=dat)

### profile over tau^2
profile(res)

### change data into long format
dat.long <- to.long(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)

### set levels of group variable ("exp" = experimental/vaccinated; "con" = control/non-vaccinated)
levels(dat.long$group) <- c("exp", "con")

### set "con" to reference level
dat.long$group <- relevel(dat.long$group, ref="con")

### calculate log odds and corresponding sampling variances
dat.long <- escalc(measure="PLO", xi=out1, mi=out2, data=dat.long)

### bivariate random-effects model using rma.mv()
res <- rma.mv(yi, vi, mods = ~ group, random = ~ group | study, struct="UN", data=dat.long)
res

### profile over tau^2_1, tau^2_2, and rho
### note: for rho, adjust region over which profiling is done ('zoom in' on area around estimate)
## Not run: 
##D par(mfrow=c(3,1))
##D profile(res, tau2=1)
##D profile(res, tau2=2)
##D profile(res, rho=1, xlim=c(.90, .98))
## End(Not run)



