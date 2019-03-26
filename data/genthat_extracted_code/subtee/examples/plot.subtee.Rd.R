library(subtee)


### Name: plot.subtee
### Title: Plotting subgroup treatment effect estimates
### Aliases: plot.subtee

### ** Examples

data(datnorm)
cand.groups <- subbuild(datnorm, height, labvalue, region, smoker)
fitd <- cbind(datnorm, cand.groups)
subgr <- colnames(cand.groups)
### Plot unadjusted estimates
res_unadj <- unadj(resp = "y", trt = "treat", subgr = subgr, data = fitd, 
             covars = ~ x1 + x2, fitfunc = "lm")
summary(res_unadj)
plot(res_unadj)
plot(res_unadj, show.compl = TRUE)
plot(res_unadj, type = "trtEffDiff")

### Compare unadjusted with model averaging estimates
res_modav <- modav(resp = "y", trt = "treat", subgr = subgr, data = fitd, 
             covars = ~ x1 + x2, fitfunc = "lm")
plot(res_unadj, res_modav, show.compl = TRUE)
plot(res_unadj, res_modav, type = "trtEffDiff")



