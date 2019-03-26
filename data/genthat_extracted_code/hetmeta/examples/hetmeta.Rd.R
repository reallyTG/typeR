library(hetmeta)


### Name: hetmeta
### Title: Deriving Measures Of Heterogeneity
### Aliases: hetmeta

### ** Examples

## load data
dat <- get(data(dat.gibson2002))

## random-effects model analysis of the standardized mean differences
dat <- escalc(measure = "SMD", m1i = m1i, sd1i = sd1i, n1i = n1i, m2i = m2i,
              sd2i = sd2i, n2i = n2i, data = dat)
res <- rma(yi, vi, data = dat, method = "REML")

## heterogeneity measures
hetmeta(res)


## load BCG vaccine data
data(dat.bcg)

## random-effects model of log relative risks
dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)
res <- rma(yi, vi, data=dat)

## heterogeneity measures
hetmeta(res)




