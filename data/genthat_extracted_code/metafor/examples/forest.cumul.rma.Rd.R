library(metafor)


### Name: forest.cumul.rma
### Title: Forest Plots (Method for 'cumul.rma' Objects)
### Aliases: forest.cumul.rma
### Keywords: hplot

### ** Examples

### calculate log risk ratios and corresponding sampling variances
dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)

### random-effects model
res <- rma(yi, vi, data=dat, slab=paste(author, year, sep=", "))

x <- cumul(res, order=order(dat$year))
forest(x, cex=.8)
forest(x, alim=c(-2,1), cex=.8)

### meta-analysis of the (log) risk ratios using the Mantel-Haenszel method
res <- rma.mh(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg,
              slab=paste(author, year, sep=", "))
x <- cumul(res, order=order(dat$year))
forest(x, alim=c(-2,1), cex=.8)



