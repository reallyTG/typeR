library(metafor)


### Name: dat.pagliaro1992
### Title: Studies on the Effectiveness of Nonsurgical Treatments in
###   Cirrhosis
### Aliases: dat.pagliaro1992
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.pagliaro1992))

### restructure dataset to a contrast-based format
dat.c <- lapply(split(dat.pagliaro1992, dat.pagliaro1992$study),
                function(x) cbind(x[-nrow(x),2:4], x[rep(nrow(x),nrow(x)-1),]))
dat.c <- do.call(rbind, dat.c)
dat.c <- dat.c[,c(4,1,5,2,3,6,7)]
names(dat.c) <- c("study", "trt1", "trt2", "ai", "n1i", "ci", "n2i")
rownames(dat.c) <- 1:nrow(dat.c)
dat.c

### Mantel-Haenszel results for beta-blockers and sclerotherapy versus control, respectively
rma.mh(measure="OR", ai=ai, n1i=n1i, ci=ci, n2i=n2i,
       data=dat.c, subset=(trt1=="beta-blockers"), digits=2)
rma.mh(measure="OR", ai=ai, n1i=n1i, ci=ci, n2i=n2i,
       data=dat.c, subset=(trt1=="sclerotherapy"), digits=2)

### calculate log odds for each study arm
dat <- escalc(measure="PLO", xi=xi, ni=ni, data=dat)

### turn treatment variable into factor and set reference level
dat$trt <- relevel(factor(dat$trt), ref="control")

### add a space before each level (this makes the output a bit more legible)
levels(dat$trt) <- paste0(" ", levels(dat$trt))

### network meta-analysis using an arm-based random-effects model with fixed study effects
### by setting rho=1/2, tau^2 reflects the amount of heterogeneity for all treatment comparisons
res <- rma.mv(yi, vi, mods = ~ factor(study) + trt - 1, random = ~ trt | study, rho=1/2, data=dat)
res

### average odds ratio comparing beta-blockers and sclerotherapy versus control, respectively
predict(res, newmods=c(rep(0,26), 1, 0), transf=exp, digits=2)
predict(res, newmods=c(rep(0,26), 0, 1), transf=exp, digits=2)

### average odds ratio comparing beta-blockers versus sclerotherapy
predict(res, newmods=c(rep(0,26), 1, -1), transf=exp, digits=2)



