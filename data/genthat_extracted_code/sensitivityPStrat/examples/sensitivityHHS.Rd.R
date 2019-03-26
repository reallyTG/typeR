library(sensitivityPStrat)


### Name: sensitivityHHS
### Title: principal stratification sensitivity analysis using the HHS
###   method.
### Aliases: sensitivityHHS

### ** Examples

data(vaccine.trial)
est.bounds<-with(vaccine.trial,
                 sensitivityHHS(z=treatment, s=hiv.outcome, y=logVL,
                     selection="infected", groupings=c("placebo","vaccine"),
                     empty.principal.stratum=c("not infected","infected"),
                     N.boot=100)
                )
est.bounds

est.bounds<-with(vaccine.trial,
                 sensitivityHHS(z=treatment, s=hiv.outcome, y=logVL,
                     selection="infected", groupings=c("placebo","vaccine"),
                     empty.principal.stratum=c("not infected","infected"),
                     method=c("ACE", "T1", "T2"), N.boot=100,
                     custom.FUN=function(mu0, mu1, ...) mu1 - mu0,
                     upperTest=TRUE, lowerTest=TRUE, twoSidedTest=TRUE)
                )
est.bounds




