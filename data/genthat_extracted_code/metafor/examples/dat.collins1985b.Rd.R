library(metafor)


### Name: dat.collins1985b
### Title: Studies on the Effects of Diuretics in Pregnancy
### Aliases: dat.collins1985b
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.collins1985b))

### calculate (log) odds ratio and sampling variance
dat <- escalc(measure="OR", n1i=pre.nti, n2i=pre.nci, ai=pre.xti, ci=pre.xci, data=dat)
summary(dat, digits=2, transf=exp)

### meta-analysis using Peto's method for any form of pre-eclampsia
rma.peto(n1i=pre.nti, n2i=pre.nci, ai=pre.xti, ci=pre.xci, data=dat, digits=2)

### meta-analysis including only studies where oedema was not a diagnostic criterion
rma.peto(n1i=pre.nti, n2i=pre.nci, ai=pre.xti, ci=pre.xci, data=dat, digits=2, subset=(oedema==0))

### meta-analyses of mortality outcomes (perinatal deaths, stillbirths, and neonatal deaths)
rma.peto(n1i=fup.nti, n2i=fup.nci, ai=ped.xti, ci=ped.xci, data=dat, digits=2)
rma.peto(n1i=fup.nti, n2i=fup.nci, ai=stb.xti, ci=stb.xci, data=dat, digits=2)
rma.peto(n1i=fup.nti, n2i=fup.nci, ai=ned.xti, ci=ned.xci, data=dat, digits=2)



