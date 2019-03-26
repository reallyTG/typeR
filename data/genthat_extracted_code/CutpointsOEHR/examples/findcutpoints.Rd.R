library(CutpointsOEHR)


### Name: findcutpoints
### Title: Find two optimal cutpoints using optimal equal-HR method
### Aliases: findcutpoints

### ** Examples


## No test: 
#### Example 1. Find two optimal cutpoints in an univariate Cox model
# Fit an univariate Cox model with pspline
require(survival)
result <- coxph(Surv(t,d)~pspline(x,df=0,caic=TRUE),data=test)
# Visualize the relationship
# Explore whether there is a U-shaped relationship between x and log relative hazard
termplot(result,se=TRUE,col.term=1,ylab='log relative hazard')
# Find two opitmal cutpoints using optimal equal-HR method.
cuts <- findcutpoints(cox_pspline_fit = result, data = test, shape='U')
cuts$optimal # output two optimal cutpoints

#### Example 2. Find two optimal cutpoints in a multivariate Cox model
# Fit a multivariate Cox model with pspline
# The independent variable which is need to find cutpoints should be placed before other covariates.
# To find cutpoints of x, Surv(t,d)~pspline(x)+x1 should be used instead of Surv(t,d)~x1+pspline(x)
require(survival)
result <- coxph(Surv(t,d)~pspline(x,df=0,caic=TRUE)+x1,data=test)
# The rest procedure is the same as example 1
# Visualize the relationship
# Explore whether there is a U-shaped relationship between x and log relative hazard
termplot(result,se=TRUE,col.term=1,ylab='log relative hazard')
# Find two opitmal cutpoints of the first independent variable.
cuts <- findcutpoints(cox_pspline_fit = result, data = test, shape='U')
cuts$optimal # output two optimal cutpoints
## End(No test)



