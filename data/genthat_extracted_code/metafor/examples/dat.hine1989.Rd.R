library(metafor)


### Name: dat.hine1989
### Title: Studies on Prophylactic Use of Lidocaine After a Heart Attack
### Aliases: dat.hine1989
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.hine1989))

### calculate risk differences and corresponding sampling variances
dat <- escalc(measure="RD", n1i=n1i, n2i=n2i, ai=ai, ci=ci, data=dat)
dat

### meta-analysis of risk differences using a random-effects model
res <- rma(yi, vi, data=dat)
res



