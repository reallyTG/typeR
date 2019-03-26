library(qrNLMM)


### Name: HIV
### Title: HIV viral load study
### Aliases: HIV
### Keywords: datasets

### ** Examples

## Not run: 
##D data(HIV)
##D attach(HIV)
##D 
##D y     = lgviral            #response
##D x     = day/100            #time
##D covar = cd4/100            #covariate
##D 
##D #Nonlinear model used in Lachos(2013)
##D 
##D #Full Nonlinear expression
##D exprNL = expression(log(exp(fixed[1]+random[1])*exp(-(fixed[2]+random[2])*x)+
##D                     exp(fixed[3]+random[3])*exp(-(fixed[4]+random[4]+fixed[5]
##D                     *covar[1])*x))/log(10))
##D 
##D #Initial values for fixed effects
##D initial = c(12,31,6,-2,0.6)
##D 
##D #A median regression (by default)
##D median_reg = QRNLMM(y,x,ind,initial,exprNL,covar)
## End(Not run)



