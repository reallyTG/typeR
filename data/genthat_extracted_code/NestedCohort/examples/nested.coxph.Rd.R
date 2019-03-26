library(NestedCohort)


### Name: nested.coxph
### Title: Estimate Cox model hazard ratios for covariates with missing
###   data
### Aliases: nested.coxph
### Keywords: models

### ** Examples

## Simple analysis of zinc and esophageal cancer data:
## We sampled zinc (variable zncent) on a fraction of the subjects, with
## sampling fractions depending on cancer status and baseline histology.
## We observed the confounding variables on almost all subjects.
data(zinc)
coxmod <- nested.coxph(coxformula="Surv(futime01,ec01==1)~
          sex+agepill+smoke+drink+mildysp+moddysp+sevdysp+anyhist+zncent",
          samplingmod="ec01*basehist",data=zinc)
summary(coxmod)

# This is the output:
# Call:
# coxph(formula = as.formula(coxformula), data = data, weights = 1/p.i.h.a.t., 
# subset = TRUE, na.action = na.omit, control = coxphcontrol, 
# x = TRUE, method = "breslow")

# n= 123, number of events= 56 
# (308 observations deleted due to missingness)

#                              coef exp(coef) se(coef)     z Pr(>|z|)    
# sexMale                    0.2953    1.3436   0.5558  0.53   0.5952    
# agepill                    0.0539    1.0554   0.0275  1.96   0.0499 *  
# smokeEver                  0.0145    1.0146   0.5870  0.02   0.9803    
# drinkEver                 -0.8548    0.4254   0.5896 -1.45   0.1471    
# mildyspMild Dysplasia      0.9023    2.4653   0.3937  2.29   0.0219 *  
# moddyspModerate Dysplasia  1.3309    3.7845   0.4212  3.16   0.0016 ** 
# sevdyspSevere Dysplasia    2.1334    8.4439   0.4615  4.62  3.8e-06 ***
# anyhistFamily History      0.0904    1.0946   0.3896  0.23   0.8165    
# zncent                    -0.2498    0.7789   0.1351 -1.85   0.0645 .  

#                           exp(coef) exp(-coef) lower .95 upper .95
# sexMale                       1.344      0.744     0.452      3.99
# agepill                       1.055      0.948     1.000      1.11
# smokeEver                     1.015      0.986     0.321      3.21
# drinkEver                     0.425      2.351     0.134      1.35
# mildyspMild Dysplasia         2.465      0.406     1.140      5.33
# moddyspModerate Dysplasia     3.784      0.264     1.658      8.64
# sevdyspSevere Dysplasia       8.444      0.118     3.417     20.86
# anyhistFamily History         1.095      0.914     0.510      2.35
# zncent                        0.779      1.284     0.598      1.02

# Concordance= NA  (se = NA )
# Rsquare= NA   (max possible= NA )
# Likelihood ratio test= NA  on 9 df,   p=NA
# Wald test            = 65.1  on 9 df,   p=1.36e-10
# Score (logrank) test = NA  on 9 df,   p=NA



