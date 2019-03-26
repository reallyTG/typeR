library(glmulti)


### Name: glmulti
### Title: Automated model selection and multimodel inference with (G)LMs
### Aliases: glmulti
### Keywords: models regression

### ** Examples

# See the document "glmulti.pdf" included in the package.
# It explains the general approach and shows how to use glmulti with mixed models from the lme4 package.
# Other examples:
# A. This shows how to do the same for zero-inflated poisson models
# we load the required package
library(pscl)
# a random vector of count data
round(runif(100, 0,20)*round(runif(100)))-> vy2
# dummy predictors
va = runif(100)
vb = runif(100)
# 1. The wrapper function
zeroinfl.glmulti=function(formula, data, inflate = "|1",...)  {
    zeroinfl(as.formula(paste(deparse(formula), inflate)),data=data,...)
} 
# The default getfit and aicc method will work for zeroinfl objects, so no need to redefine them
# we can proceed directly
glmulti(vy2~va*vb,fitfunc=zeroinfl.glmulti,inflate="|1")->bab


# B. This shows how to include some terms in ALL the models
# As above, we just prepare a wrapper of the fitting function
glm.redefined = function(formula, data, always="", ...) {
glm(as.formula(paste(deparse(formula), always)), data=data, ...)
}
# we then use this fitting function in glmulti
glmulti(vy2~va,level=1,fitfunc=glm.redefined,always="+vb")-> bab
# va will be shuffled but vb is always included in the models

# this procedure allows support of arbitrarily any fitting function, or the use of sophisticated constraints on the model structure




