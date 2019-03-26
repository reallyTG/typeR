library(metafor)


### Name: dat.bonett2010
### Title: Studies on the Reliability of the CES-D Scale
### Aliases: dat.bonett2010
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.bonett2010))

### meta-analysis using the raw alpha values
res <- rma(measure="ARAW", ai=ai, mi=mi, ni=ni, data=dat)
res

### meta-analysis using transformed alpha values (using the
### transformation suggested by Hakstian & Whalen, 1976)
res <- rma(measure="AHW", ai=ai, mi=mi, ni=ni, data=dat)
res
predict(res, transf=transf.iahw)

### meta-analysis using transformed alpha values (using the
### transformation suggested by Bonett, 2002)
res <- rma(measure="ABT", ai=ai, mi=mi, ni=ni, data=dat)
res
predict(res, transf=transf.iabt)

### examine whether female/mixed samples yield different alphas (with raw alphas)
res <- rma(measure="ARAW", ai=ai, mi=mi, ni=ni, mods = ~ caregivers, data=dat)
res
predict(res, newmods=c(0,1), digits=2)



