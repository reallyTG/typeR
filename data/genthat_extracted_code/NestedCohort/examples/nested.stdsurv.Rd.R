library(NestedCohort)


### Name: nested.stdsurv
### Title: Estimate Standardized Survivals and Attributable Risks for
###   covariates with missing data
### Aliases: nested.stdsurv
### Keywords: models

### ** Examples

## Simple analysis of zinc and esophageal cancer data:
## We sampled zinc (variable znquartiles) on a fraction of the subjects, with
## sampling fractions depending on cancer status and baseline histology.
## We observed the confounding variables on almost all subjects.
data(zinc)
mod <- nested.stdsurv(outcome="Surv(futime01,ec01==1)",
                      exposures="znquartiles",
                      confounders="sex+agestr+smoke+drink+mildysp+moddysp+sevdysp+anyhist",
                      samplingmod="ec01*basehist",exposureofinterest="Q4",data=zinc)

# This is the output:
#  Standardized Survival for znquartiles by time 5893 
#        Survival  StdErr 95% CI Left 95% CI Right
#  Q1      0.5443 0.07232      0.3932       0.6727
#  Q2      0.7595 0.07286      0.5799       0.8703
#  Q3      0.7045 0.07174      0.5383       0.8203
#  Q4      0.8911 0.06203      0.6863       0.9653
#  Crude   0.7784 0.02491      0.7249       0.8228

#  Standardized Risk Differences vs. znquartiles = Q4 by time 5893 
#             Risk Difference  StdErr 95% CI Left 95% CI Right
#  Q4 - Q1             0.3468 0.10376    0.143412       0.5502
#  Q4 - Q2             0.1316 0.09605   -0.056694       0.3198
#  Q4 - Q3             0.1866 0.09355    0.003196       0.3699
#  Q4 - Crude          0.1126 0.06353   -0.011871       0.2372

# PAR if everyone had znquartiles = Q4 
#     Estimate StdErr 95% PAR CI Left 95% PAR CI Right
# PAR   0.5084 0.2777         -0.4872           0.8375



