library(metafor)


### Name: dat.gibson2002
### Title: Studies on the Effectiveness of Self-Management Education and
###   Regular Medical Review for Adults with Asthma
### Aliases: dat.gibson2002
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.gibson2002))

### fixed-effects model analysis of the standardized mean differences
dat <- escalc(measure="SMD", m1i=m1i, sd1i=sd1i, n1i=n1i, m2i=m2i, sd2i=sd2i, n2i=n2i, data=dat)
res <- rma(yi, vi, data=dat, method="FE")
print(res, digits=2)

### fixed-effects model analysis of the (log) risk ratios
dat <- escalc(measure="RR", ai=ai, bi=bi, ci=ci, di=di, data=dat)
res <- rma(yi, vi, data=dat, method="FE")
print(res, digits=2)
predict(res, transf=exp, digits=2)

### fixed-effects model analysis of the standardized mean differences and the probit transformed
### risk differences (which also provide estimates of the standardized mean difference)
dat <- escalc(measure="SMD", m1i=m1i, sd1i=sd1i, n1i=n1i, m2i=m2i, sd2i=sd2i, n2i=n2i, data=dat)
dat <- escalc(measure="PBIT", ai=ai, bi=bi, ci=ci, di=di, data=dat, replace=FALSE)
dat
res <- rma(yi, vi, data=dat, method="FE")
print(res, digits=2)



