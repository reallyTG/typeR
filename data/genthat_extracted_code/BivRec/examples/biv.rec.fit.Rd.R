library(BivRec)


### Name: biv.rec.fit
### Title: Semi-Parametric Accelerated Failure Time Analysis of Bivariate
###   Alternating Recurrent Event Gap Time Data
### Aliases: biv.rec.fit
### Keywords: biv.rec.fit

### ** Examples

library(BivRec)
# Simulate bivariate alternating recurrent event data
set.seed(1234)
biv.rec.data <- biv.rec.sim(nsize=150, beta1=c(0.5,0.5), beta2=c(0,-0.5), tau_c=63, set=1.1)
# Apply Lee C, Huang CY, Xu G, Luo X (2017) method using one covariate
fit.lee <- biv.rec.fit(formula = id + epi + xij + yij + d1 + d2 ~ a1,
                data=biv.rec.data, method="Lee.et.al", CI=NULL)
fit.lee$covariate.effects
## Not run: 
##D 
##D #This is an example with longer runtime.
##D 
##D library(BivRec)
##D # Simulate bivariate alternating recurrent event data
##D set.seed(1234)
##D biv.rec.data <- biv.rec.sim(nsize=150, beta1=c(0.5,0.5), beta2=c(0,-0.5), tau_c=63, set=1.1)
##D 
##D # Apply Lee C, Huang CY, Xu G, Luo X (2017) method using multiple covariates
##D # and 99% confidence intervals.
##D fit.lee <- biv.rec.fit(formula = id + epi + xij + yij + d1 + d2 ~ a1 + a2,
##D                 data=biv.rec.data, method="Lee.et.al", CI=0.99)
##D fit.lee$covariate.effects
##D 
## End(Not run)
# To apply Chang (2004) method use method="Chang"





