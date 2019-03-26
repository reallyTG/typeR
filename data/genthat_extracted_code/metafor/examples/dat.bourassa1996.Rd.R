library(metafor)


### Name: dat.bourassa1996
### Title: Studies on the Association between Handedness and Eye-Dominance
### Aliases: dat.bourassa1996
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.bourassa1996))

### calculate log(OR) and corresponding sampling variance with 1/2 correction
dat <- escalc(measure="OR", ai=lh.le, bi=lh.re, ci=rh.le, di=rh.re, data=dat, add=1/2, to="all")

### overall association between handedness and eyedness
res <- rma(yi, vi, data=dat, subset=sex=="combined")
res
predict(res, transf=exp, digits=2)



