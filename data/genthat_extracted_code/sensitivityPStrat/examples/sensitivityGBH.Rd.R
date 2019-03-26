library(sensitivityPStrat)


### Name: sensitivityGBH
### Title: Principal stratification sensitivity analysis.
### Aliases: sensitivityGBH
### Keywords: design

### ** Examples

data(vaccine.trial)
ans<-with(vaccine.trial,
          sensitivityGBH(z=treatment,s=hiv.outcome,y=logVL,
                    beta=c(0,.25,.5,.75,1,1.25,1.5),
                    selection="infected",
                    groupings=c("placebo","vaccine"),
                    empty.principal.stratum=c("not infected","infected"),
                    N.boot=100)
         )
ans

ans<-with(vaccine.trial,
          sensitivityGBH(z=treatment,s=hiv.outcome,y=logVL,
                    beta=c(-Inf,-1,-0.75,-0.5,-0.25,0,.25,.5,.75,1,Inf),
                    selection="infected",
                    groupings=c("placebo","vaccine"),
                    empty.principal.stratum=c("not infected","infected"),
                    ci.method="bootstrap", ci=c(0.95, 0.9, 0.9),
                    ci.type=c('twoSided', 'upper', 'lower'),
                    custom.FUN=function(mu0, mu1, ...) mu1 - mu0,
                    N.boot=100, method=c("ACE", "T1", "T2"),
                    upperTest=TRUE, lowerTest=TRUE, twoSidedTest=TRUE)
         )
ans



