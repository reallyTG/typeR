library(sem)


### Name: standardizedCoefficients
### Title: Standardized Coefficients for Structural Equation Models
### Aliases: standardizedCoefficients standardizedCoefficients.sem
###   standardizedCoefficients.msem stdCoef
### Keywords: models

### ** Examples

# In the first example, readMoments() and specifyModel() read from the
# input stream. This example cannot be executed via example() but can be entered
# at the command prompt. The example is repeated using file input;
# this example can be executed via example(). 
    ## Not run: 
##D # Duncan, Haller, and Portes peer-influences model
##D 
##D R.DHP <- readMoments(diag=FALSE, names=c("ROccAsp", "REdAsp", "FOccAsp", 
##D                 "FEdAsp", "RParAsp", "RIQ", "RSES", "FSES", "FIQ", "FParAsp"))
##D     .6247     
##D     .3269  .3669       
##D     .4216  .3275  .6404
##D     .2137  .2742  .1124  .0839
##D     .4105  .4043  .2903  .2598  .1839
##D     .3240  .4047  .3054  .2786  .0489  .2220
##D     .2930  .2407  .4105  .3607  .0186  .1861  .2707
##D     .2995  .2863  .5191  .5007  .0782  .3355  .2302  .2950
##D     .0760  .0702  .2784  .1988  .1147  .1021  .0931 -.0438  .2087
##D             
##D model.dhp <- specifyModel()
##D     RParAsp  -> RGenAsp, gam11,  NA
##D     RIQ      -> RGenAsp, gam12,  NA
##D     RSES     -> RGenAsp, gam13,  NA
##D     FSES     -> RGenAsp, gam14,  NA
##D     RSES     -> FGenAsp, gam23,  NA
##D     FSES     -> FGenAsp, gam24,  NA
##D     FIQ      -> FGenAsp, gam25,  NA
##D     FParAsp  -> FGenAsp, gam26,  NA
##D     FGenAsp  -> RGenAsp, beta12, NA
##D     RGenAsp  -> FGenAsp, beta21, NA
##D     RGenAsp  -> ROccAsp,  NA,     1
##D     RGenAsp  -> REdAsp,  lam21,  NA
##D     FGenAsp  -> FOccAsp,  NA,     1
##D     FGenAsp  -> FEdAsp,  lam42,  NA
##D     RGenAsp <-> RGenAsp, ps11,   NA
##D     FGenAsp <-> FGenAsp, ps22,   NA
##D     RGenAsp <-> FGenAsp, ps12,   NA
##D     ROccAsp <-> ROccAsp, theta1, NA
##D     REdAsp  <-> REdAsp,  theta2, NA
##D     FOccAsp <-> FOccAsp, theta3, NA
##D     FEdAsp  <-> FEdAsp,  theta4, NA
##D 
##D sem.dhp <- sem(model.dhp, R.DHP, 329,
##D     fixed.x=c('RParAsp', 'RIQ', 'RSES', 'FSES', 'FIQ', 'FParAsp'))
##D standardizedCoefficients(sem.dhp) 
##D 	
## End(Not run)
# The following example can be executed via example():

etc <- system.file(package="sem", "etc") # path to data and model files
   
(R.DHP <- readMoments(file=file.path(etc, "R-DHP.txt"),
				diag=FALSE, names=c("ROccAsp", "REdAsp", "FOccAsp", 
                "FEdAsp", "RParAsp", "RIQ", "RSES", "FSES", "FIQ", "FParAsp")))
(model.dhp <- specifyModel(file=file.path(etc, "model-DHP.txt")))
(sem.dhp <- sem(model.dhp, R.DHP, 329,
    fixed.x=c('RParAsp', 'RIQ', 'RSES', 'FSES', 'FIQ', 'FParAsp')))
standardizedCoefficients(sem.dhp) 



