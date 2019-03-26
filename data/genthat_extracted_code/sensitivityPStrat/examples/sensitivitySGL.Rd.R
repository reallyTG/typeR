library(sensitivityPStrat)


### Name: sensitivitySGL
### Title: principal stratification sensitivity analysis with time to event
###   data
### Aliases: sensitivitySGL

### ** Examples


data(vaccine.trial)
sens.time<-with(vaccine.trial,
                sensitivitySGL(z=treatment, s=hiv.outcome, y=followup.yearsART,
                          d=ARTinitiation, beta=c(.25, 0,-.25), tau=3,
                          time.points=c(2,3), selection="infected",
                          trigger="initiated ART", groupings=c("placebo","vaccine"),
                          empty.principal.stratum=c("not infected","infected"),
                          N.boot=50, interval=c(-200,200),
                          upperTest=TRUE, lowerTest=TRUE, twoSidedTest=TRUE)
               )
sens.time

sens.time2<-with(vaccine.trial,
                sensitivitySGL(z=treatment, s=hiv.outcome, y=followup.yearsART,
                          d=ARTinitiation, beta=c(.25, 0,-.25), tau=3,
                          time.points=c(2,3), selection="infected",
                          trigger="initiated ART", groupings=c("placebo","vaccine"),
                          empty.principal.stratum=c("not infected","infected"),
                          custom.FUN=function(Fas0,Fas1,time.points,
                ...) { Fas0(time.points) - Fas1(time.points) },
                          N.boot=50, interval=c(-200,200))
               )
sens.time2

sens.time3<-with(vaccine.trial,
                sensitivitySGL(z=treatment, s=hiv.outcome, y=followup.yearsART,
                          d=ARTinitiation, beta=c(-Inf,.25,0,-.25,Inf),
                          tau=3, time.points=c(2,3), selection="infected",
                          trigger="initiated ART", groupings=c("placebo","vaccine"),
                          empty.principal.stratum=c("not infected","infected"),
                          custom.FUN=function(Fas0,Fas1,time.points,
                ...) { Fas0(time.points) - Fas1(time.points) },
                          N.boot=50, interval=c(-200,200))
               )
sens.time3




