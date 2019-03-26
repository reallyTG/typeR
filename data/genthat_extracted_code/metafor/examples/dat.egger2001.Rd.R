library(metafor)


### Name: dat.egger2001
### Title: Studies on the Effectiveness of Intravenous Magnesium in Acute
###   Myocardial Infarction.
### Aliases: dat.egger2001
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.egger2001))

### meta-analysis of trials 1-7 using Peto's method (as in Teo et al., 1991)
res <- rma.peto(ai=ai, n1i=n1i, ci=ci, n2i=n2i, data=dat, subset=1:7)
print(res, digits=2)

### meta-analysis of trials 1-7 and LIMIT-2 (as in Yusuf et al., 1993)
res <- rma.peto(ai=ai, n1i=n1i, ci=ci, n2i=n2i, data=dat, subset=c(1:7,14))
print(res, digits=2)

### meta-analysis of all trials except ISIS-4
res <- rma.peto(ai=ai, n1i=n1i, ci=ci, n2i=n2i, data=dat, subset=-16)
print(res, digits=2)
predict(res, transf=exp, digits=2)

### meta-analysis of all trials including ISIS-4
res <- rma.peto(ai=ai, n1i=n1i, ci=ci, n2i=n2i, data=dat)
print(res, digits=2)
predict(res, transf=exp, digits=2)

### contour-enhanced funnel plot centered at 0
funnel(res, refline=0, level=c(90, 95, 99), shade=c("white", "gray", "darkgray"))



