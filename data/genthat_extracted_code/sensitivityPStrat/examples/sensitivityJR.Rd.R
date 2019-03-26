library(sensitivityPStrat)


### Name: sensitivityJR
### Title: Principal stratification sensitivity analysis relaxing the
###   monotonicity assumption.
### Aliases: sensitivityJR

### ** Examples



data(vaccine.trial)
ansJR<-with(vaccine.trial,
          sensitivityJR(z=treatment,s=hiv.outcome,y=logVL,
                    beta0=c(-1,-.5,0,.5,1),
                    beta1=c(-1,-.5,0,.5,1),
                    phi=c(0.95,0.9), selection="infected",
                    groupings=c("placebo","vaccine"),
                    N.boot=100)
         )
ansJR

data(vaccine.trial)
ansJR<-with(vaccine.trial,
          sensitivityJR(z=treatment,s=hiv.outcome,y=logVL,
                    beta0=c(-1,-.5,0,.5,1),
                    beta1=c(-1,-.5,0,.5,1),
                    phi=c(0.95,0.9), selection="infected",
                    groupings=c("placebo","vaccine"),
                    custom.FUN=function(mu0, mu1, ...) mu1 - mu0,
                    upperTest=TRUE, lowerTest=TRUE, twoSidedTest=TRUE,
                    N.boot=100)
         )
ansJR




