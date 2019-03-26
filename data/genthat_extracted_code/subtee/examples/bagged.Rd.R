library(subtee)


### Name: bagged
### Title: Bootstrap estimates for interaction terms in exploratory
###   subgroup analyses
### Aliases: bagged
### Keywords: models

### ** Examples

## Not run: 
##D ## toy example calls using the simulated datnorm data-set without
##D ## treatment and subgroup effect, see ?datnorm for details
##D data(datnorm)
##D head(datnorm)
##D 
##D ## first need to create candidate subgroups (if not already defined in data-set)
##D ## here generate candidate subgroups manually (need to be numeric 0-1 variables)
##D groups <- data.frame(labvalL.5=as.numeric(datnorm$labvalue < 0.5),
##D                      regUS=as.numeric(datnorm$region == "US"),
##D                      hgtL175=as.numeric(datnorm$height < 175))
##D fitdat <- cbind(datnorm, groups) # bind subgroup variables to main data
##D ## subgroups of interest
##D subgr <- c("labvalL.5", "regUS", "hgtL175")
##D res <- bagged(resp = "y", trt = "treat", subgr = subgr, data = fitdat, 
##D                        covars = ~ x1 + x2, fitfunc = "lm")
##D res
##D 
##D 
##D ## generate candidate subgroups using the subbuild function
##D ## semi-automatically i.e. some groups specified directly (height and
##D ## smoker), for region and labvalue subbuild generates subgroups (see
##D ## ?subbuild)
##D cand.groups <- subbuild(datnorm, height < 175, smoker == 1, region, labvalue)
##D head(cand.groups)
##D fitdat <- cbind(datnorm, cand.groups) 
##D subgr <- colnames(cand.groups)
##D res <- bagged(resp = "y", trt = "treat", subgr = subgr, data = fitdat, 
##D                        covars = ~ x1 + x2, fitfunc = "lm")
##D res
##D 
##D ## toy example call for binary data on simulated datbin data-set
##D data(datbin)
##D cand.groups <- subbuild(datbin, height < 175, smoker == 1, region, labvalue)
##D fitdat <- cbind(datbin, cand.groups) 
##D subgr <- colnames(cand.groups)
##D res <- bagged(resp = "y", trt = "treat", subgr = subgr, data = fitdat, 
##D                        covars = ~ x1 + x2, fitfunc = "glm", 
##D                        family = binomial(link = "logit"))
##D ## scale of the treatment effect estimate: difference on log-odds scale
##D res
##D 
##D ## toy example call for parametric and semi-parametric survival data on
##D ## datsurv data-set
##D data(datsurv)
##D cand.groups <- subbuild(datsurv, height < 175, smoker == 1, region, labvalue)
##D fitdat <- cbind(datsurv, cand.groups)
##D subgr <- colnames(cand.groups)
##D res.survreg <- bagged(resp = "y", trt = "treat", subgr = subgr, data = fitdat,
##D                                covars = ~ x1 + x2,
##D                                fitfunc = "survreg", event = "event", dist = "exponential")
##D ## parametric survival model (here exponential distribution)
##D ## scale of treatment effect estimate: log scale (see ?survreg for details)
##D res.survreg
##D 
##D # Decreased B for a reduction in computational time
##D res.cox <- bagged(resp = "y", trt = "treat", subgr = subgr, data = fitdat,
##D                   fitfunc = "coxph", event = "event", B = 20) # B=2000 should be used
##D ## scale of treatment effect estimate: difference in log-hazard rate
##D res.cox
##D ## toy example call overdispersed count data on datcount data-set
##D data(datcount)
##D cand.groups <- subbuild(datcount, height < 175, smoker == 1, region, labvalue)
##D fitdat <- cbind(datcount, cand.groups)
##D subgr <- colnames(cand.groups)
##D # Decreased B for a reduction in computational time
##D res <- bagged(resp = "y", trt = "treat", subgr = subgr, data = fitdat,
##D               fitfunc = "glm.nb", exposure = "exposure", B = 20) # B=2000 should be used
##D ## scale of treatment effect estimate: difference on log scale
##D res
## End(Not run)



