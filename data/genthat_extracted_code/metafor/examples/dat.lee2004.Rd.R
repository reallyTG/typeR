library(metafor)


### Name: dat.lee2004
### Title: Studies on Acupoint P6 Stimulation for Preventing Nausea
### Aliases: dat.lee2004
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.lee2004))

### meta-analysis based on log risk ratios
res <- rma(measure="RR", ai=ai, n1i=n1i, ci=ci, n2i=n2i, data=dat)
res
predict(res, transf=exp, digits=2)



