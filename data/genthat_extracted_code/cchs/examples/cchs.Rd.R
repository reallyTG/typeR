library(cchs)


### Name: cchs
### Title: Cox model for case-cohort data with stratified
###   subcohort-selection
### Aliases: cchs

### ** Examples

# Analyze the relation between survival and three covariates in cchsData. 
# The times are stored as numbers of days, so precision has to be 1. The 
# selection of the subcohort was stratified according to two strata, defined 
# by cchsData$localHistol, and the sampling fractions are stored in 
# cchsData$sampFrac. 

cchs(Surv(time, isCase) ~ stage + centralLabHistol + ageAtDiagnosis, 
      data=cchsData, inSubcohort=inSubcohort, stratum=localHistol, 
      samplingFractions=sampFrac, precision=1) 

# Do the same analysis using cohortStratumSizes instead of samplingFractions.
# For the value of cohortStratumSizes see the Details section of ?cchsData. 
# These two calls to cchs will give slightly different results unless set.seed  
# is used with the same seed just before both of them.

cchs(Surv(time, isCase) ~ stage + centralLabHistol + ageAtDiagnosis, 
      data=cchsData, inSubcohort=inSubcohort, stratum=localHistol, 
      cohortStratumSizes=c(favorable=3622, unfavorable=406), precision=1) 



