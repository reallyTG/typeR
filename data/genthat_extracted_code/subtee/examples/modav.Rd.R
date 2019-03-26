library(subtee)


### Name: modav
### Title: Treatment effect estimation using model averaging based on
###   marginal models.
### Aliases: modav
### Keywords: models

### ** Examples

## toy example calls using the simulated datnorm data-set without
## treatment and subgroup effect, see ?datnorm for details
data(datnorm)
head(datnorm)

## first need to create candidate subgroups (if not already defined in data-set)
## here generate candidate subgroups manually (need to be numeric 0-1 variables)
groups <- data.frame(labvalL.5=as.numeric(datnorm$labvalue < 0.5),
                     regUS=as.numeric(datnorm$region == "US"),
                     hgtL175=as.numeric(datnorm$height < 175))
fitdat <- cbind(datnorm, groups) # bind subgroup variables to main data
## subgroups of interest
subgr <- c("labvalL.5", "regUS", "hgtL175")
res <- modav(resp = "y", trt = "treat", subgr = subgr, data = fitdat, 
             covars = ~ x1 + x2, fitfunc = "lm")
summary(res)
plot(res, show.compl=TRUE)
## compare to unadjusted analysis
res <- unadj(resp = "y", trt = "treat", subgr = subgr, data = fitdat, 
             covars = ~ x1 + x2, fitfunc = "lm")
summary(res)
plot(res)
                     
## generate candidate subgroups using the subbuild function
## semi-automatically i.e. some groups specified directly (height and
## smoker), for region and labvalue subbuild generates subgroups (see
## ?subbuild).
cand.groups <- subbuild(datnorm, height < 175, smoker == 1, region, labvalue)
head(cand.groups)
fitdat <- cbind(datnorm, cand.groups) 
subgr <- colnames(cand.groups)
resMA <- modav(resp = "y", trt = "treat", subgr = subgr, data = fitdat, 
               covars = ~ x1 + x2, fitfunc = "lm")
summary(resMA)
plot(resMA, show.compl = TRUE)

## toy example call for binary data on simulated datbin data-set
data(datbin)
cand.groups <- subbuild(datbin, height < 175, smoker == 1, region, labvalue)
fitdat <- cbind(datbin, cand.groups) 
subgr <- colnames(cand.groups)
res <- modav(resp = "y", trt = "treat", subgr = subgr, data = fitdat, 
             covars = ~ x1 + x2, fitfunc = "glm", 
             family = binomial(link = "logit"))
## scale of the treatment effect estimate: difference on log-odds scale
summary(res)
plot(res)

## toy example call for parametric and semi-parametric survival data on
## datsurv data-set
data(datsurv)
cand.groups <- subbuild(datsurv, height < 175, smoker == 1, region, labvalue)
fitdat <- cbind(datsurv, cand.groups)
subgr <- colnames(cand.groups)
res.survreg <- modav(resp = "y", trt = "treat", subgr = subgr, data = fitdat,
                     covars = ~ x1 + x2,
                     fitfunc = "survreg", event = "event", dist = "exponential")
## parametric survival model (here exponential distribution)
## scale of treatment effect estimate: log scale (see ?survreg for details)
summary(res.survreg)
plot(res.survreg)
res.cox <- modav(resp = "y", trt = "treat", subgr = subgr, data = fitdat,
                 covars = ~ x1 + x2, fitfunc = "coxph", event = "event")
## scale of treatment effect estimate: difference in log-hazard rate
summary(res.cox)
plot(res.cox)

## toy example call overdispersed count data on datcount data-set
data(datcount)
cand.groups <- subbuild(datcount, height < 175, smoker == 1, region, labvalue)
fitdat <- cbind(datcount, cand.groups)
subgr <- colnames(cand.groups)
res <- modav(resp = "y", trt = "treat", subgr = subgr, data = fitdat,
             covars = ~ x1 + x2, fitfunc = "glm.nb", exposure = "exposure")
## scale of treatment effect estimate: difference on log scale
summary(res)
plot(res)



