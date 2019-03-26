library(sensitivityPStrat)


### Name: sensitivitySGD
### Title: principal stratification sensitivity analysis with time to event
###   data relaxing monotonicity assumption.
### Aliases: sensitivitySGD

### ** Examples


data(vaccine.trial)
sens.analysis<-with(vaccine.trial,
                sensitivitySGD(z=treatment, s=hiv.outcome, y=followup.yearsART,
                          d=ARTinitiation, beta0=c(0,-.25,-.5),
                          beta1=c(0, -.25, -.5), phi=c(0.95, 0.90), tau=3,
                          time.points=c(2,3), selection="infected",
                          trigger="initiated ART",
                          groupings=c("placebo","vaccine"), ci=.95,
                          ci.method="bootstrap", N.boot=100)
               )
sens.analysis


sens.analysis2<-with(vaccine.trial,
                sensitivitySGD(z=treatment, s=hiv.outcome, y=followup.yearsART,
                          d=ARTinitiation, beta0=c(0,-.25,-.5),
                          beta1=c(0, -.25, -.5), phi=c(0.95, 0.90), tau=3,
                          time.points=c(2,3), selection="infected",
                          trigger="initiated ART",
                          groupings=c("placebo","vaccine"), ci=.95,
                          custom.FUN=function(Fas0,Fas1,...,time.points) {
                            Fas0(time.points) - Fas1(time.points)
                          },
                          ci.method="bootstrap", N.boot=100)
               )
sens.analysis2




