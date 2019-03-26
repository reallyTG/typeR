library(spaMM)


### Name: COMPoisson
### Title: Conway-Maxwell-Poisson (COM-Poisson) GLM family
### Aliases: COMPoisson geometric
### Keywords: models regression

### ** Examples

# Fitting COMPoisson model with estimated nu parameter:
data("freight") ## example from Sellers & Shmueli, Ann. Appl. Stat. 4: 943–961 (2010)
fitme(broken ~ transfers, data=freight, family = COMPoisson())
# GLMM with under-dispersed conditional response
HLfit(broken ~ transfers+(1|id), data=freight, family = COMPoisson(nu=10),HLmethod="ML")

## Not run: 
##D   data("freight")
##D   # Equivalence of poisson() and COMPoisson(nu=1):
##D   COMPglm <- glm(broken ~ transfers, data=freight, family = poisson())
##D   coef(COMPglm)
##D   logLik(COMPglm)
##D   COMPglm <- glm(broken ~ transfers, data=freight, family = COMPoisson(nu=1))
##D   coef(COMPglm)
##D   logLik(COMPglm)
##D   HLfit(broken ~ transfers, data=freight, family = COMPoisson(nu=1))
## End(Not run)



