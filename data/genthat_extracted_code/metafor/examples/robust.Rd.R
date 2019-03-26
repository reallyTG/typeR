library(metafor)


### Name: robust
### Title: Compute (Cluster) Robust Tests and Confidence Intervals for
###   'rma' Objects
### Aliases: robust robust.rma.uni robust.rma.mv
### Keywords: htest

### ** Examples

### load data
dat <- get(data(dat.konstantopoulos2011))

### multilevel random-effects model
res <- rma.mv(yi, vi, random = ~ 1 | district/school, data=dat)
res

### results based on sandwich method
robust(res, cluster=dat$district)

### load data
dat <- get(data(dat.berkey1998))

### construct list of the variance-covariance matrices of the observed outcomes for the studies
V <- lapply(split(dat[,c("v1i", "v2i")], dat$trial), as.matrix)

### construct block diagonal matrix
V <- bldiag(V)

### fit multivariate model
res <- rma.mv(yi, V, mods = ~ outcome - 1, random = ~ outcome | trial, struct="UN", data=dat)
res

### results based on sandwich method
robust(res, cluster=dat$trial)



