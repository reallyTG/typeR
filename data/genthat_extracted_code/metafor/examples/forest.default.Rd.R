library(metafor)


### Name: forest.default
### Title: Forest Plots (Default Method)
### Aliases: forest.default
### Keywords: hplot

### ** Examples

### calculate log risk ratios and corresponding sampling variances
dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)

### default forest plot of the observed log risk ratios
forest(dat$yi, dat$vi)

### forest plot of the observed risk ratios
forest(dat$yi, dat$vi, slab=paste(dat$author, dat$year, sep=", "), transf=exp,
       alim=c(0,2), steps=5, xlim=c(-2.5,4), refline=1, cex=.9)

### forest plot of the observed risk ratios
forest(dat$yi, dat$vi, slab=paste(dat$author, dat$year, sep=", "), atransf=exp,
       at=log(c(.05,.25,1,4,20)), xlim=c(-10,8), cex=.9)

### forest plot of the observed risk ratios with studies ordered by the RRs
forest(dat$yi, dat$vi, slab=paste(dat$author, dat$year, sep=", "), atransf=exp,
       at=log(c(.05,.25,1,4,20)), xlim=c(-10,8), cex=.9, subset=order(dat$yi))

### see also examples for the forest.rma function



