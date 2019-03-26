library(metafor)


### Name: dat.laopaiboon2015
### Title: Studies on the Effectiveness of Azithromycin for Treating Lower
###   Respiratory Tract Infections
### Aliases: dat.laopaiboon2015
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.laopaiboon2015))

### analysis using the Mantel-Haenszel method
rma.mh(measure="RR", ai=ai, n1i=n1i, ci=ci, n2i=n2i, data=dat, digits=3)

### calculate log risk ratios and corresponding sampling variances
dat <- escalc(measure="RR", ai=ai, n1i=n1i, ci=ci, n2i=n2i, data=dat)

### random-effects model
res <- rma(yi, vi, data=dat)
res

### average risk ratio with 95% CI
predict(res, transf=exp)



