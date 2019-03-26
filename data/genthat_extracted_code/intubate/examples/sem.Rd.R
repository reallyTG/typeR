library(intubate)


### Name: sem
### Title: Interfaces for sem package for data science pipelines.
### Aliases: ntbt_rawMoments ntbt_sem ntbt_tsls
### Keywords: intubate magrittr sem rawMoments sem tsls

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(sem)
##D 
##D 
##D ## ntbt_rawMoments: Compute Raw Moments Matrix
##D ## Original function to interface
##D rawMoments(~ Q + P + D + F + A, data = Kmenta)
##D 
##D ## The interface puts data as first parameter
##D ntbt_rawMoments(Kmenta, ~ Q + P + D + F + A)
##D 
##D ## so it can be used easily in a pipeline.
##D Kmenta %>%
##D   ntbt_rawMoments(~ Q + P + D + F + A)
##D 
##D 
##D ## ntbt_sem: General Structural Equation Models
##D ## NOTE: this example is NOT using the formula interface.
##D ##       It is creating a list with the variables.
##D R.DHP <- readMoments(diag=FALSE, names=c("ROccAsp", "REdAsp", "FOccAsp", 
##D                 "FEdAsp", "RParAsp", "RIQ", "RSES", "FSES", "FIQ", "FParAsp"),
##D                 text="
##D     .6247     
##D     .3269  .3669       
##D     .4216  .3275  .6404
##D     .2137  .2742  .1124  .0839
##D     .4105  .4043  .2903  .2598  .1839
##D     .3240  .4047  .3054  .2786  .0489  .2220
##D     .2930  .2407  .4105  .3607  .0186  .1861  .2707
##D     .2995  .2863  .5191  .5007  .0782  .3355  .2302  .2950
##D     .0760  .0702  .2784  .1988  .1147  .1021  .0931 -.0438  .2087
##D ")
##D 
##D model.dhp.1 <- specifyEquations(covs="RGenAsp, FGenAsp", text="
##D RGenAsp = gam11*RParAsp + gam12*RIQ + gam13*RSES + gam14*FSES + beta12*FGenAsp
##D FGenAsp = gam23*RSES + gam24*FSES + gam25*FIQ + gam26*FParAsp + beta21*RGenAsp
##D ROccAsp = 1*RGenAsp
##D REdAsp = lam21(1)*RGenAsp  # to illustrate setting start values
##D FOccAsp = 1*FGenAsp
##D FEdAsp = lam42(1)*FGenAsp
##D ")
##D 
##D dta <- list(R.DHP = R.DHP, model.dhp.1 = model.dhp.1)
##D rm(R.DHP, model.dhp.1)
##D 
##D ## Original function to interface
##D attach(dta)
##D sem.dhp.1 <- ntbt_sem(model.dhp.1, R.DHP, 329,
##D                       fixed.x=c('RParAsp', 'RIQ', 'RSES', 'FSES', 'FIQ', 'FParAsp'))
##D summary(sem.dhp.1)
##D detach()
##D 
##D ## The interface puts data as first parameter
##D sem.dhp.1 <- ntbt_sem(dta, model.dhp.1, R.DHP, 329,
##D                       fixed.x=c('RParAsp', 'RIQ', 'RSES', 'FSES', 'FIQ', 'FParAsp'))
##D summary(sem.dhp.1)
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_sem(model.dhp.1, R.DHP, 329,
##D            fixed.x=c('RParAsp', 'RIQ', 'RSES', 'FSES', 'FIQ', 'FParAsp')) %>%
##D   summary()
##D 
##D 
##D ## ntbt_tsls: Two-Stage Least Squares
##D ## Original function to interface
##D tsls(Q ~ P + D, ~ D + F + A, data = Kmenta)
##D 
##D ## The interface puts data as first parameter
##D ntbt_tsls(Kmenta, Q ~ P + D, ~ D + F + A)
##D 
##D ## so it can be used easily in a pipeline.
##D Kmenta %>%
##D   ntbt_tsls(Q ~ P + D, ~ D + F + A)
## End(Not run)



