library(metafor)


### Name: dat.hackshaw1998
### Title: Studies on Lung Cancer Risk from ETS Exposure
### Aliases: dat.hackshaw1998
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.hackshaw1998))

### random-effects model using the log odds ratios
res <- rma(yi, vi, data=dat, method="DL")
res

### estimated average odds ratio with CI (and credibility/prediction interval)
predict(res, transf=exp, digits=2)



