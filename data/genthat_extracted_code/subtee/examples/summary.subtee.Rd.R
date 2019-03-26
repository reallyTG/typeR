library(subtee)


### Name: summary.subtee
### Title: Summarizing subgroup analyses estimates
### Aliases: summary.subtee

### ** Examples

data(datnorm)
cand.groups <- subbuild(datnorm, height, labvalue, region, smoker)
fitd <- cbind(datnorm, cand.groups)
subgr <- colnames(cand.groups)
res <- modav(resp = "y", trt = "treat", subgr = subgr, data = fitd, 
             covars = ~ x1 + x2, fitfunc = "lm")
summary(res)



