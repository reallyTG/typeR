library(sensitivityPStrat)


### Name: plot.sensitivity
### Title: plots the results of calls to the sensitivity functions.
### Aliases: plot.sensitivity plot.sensitivity.1.0d plot.sensitivity.2.0d
###   plot.sensitivity.1.1d
### Keywords: hplot

### ** Examples

data(vaccine.trial)

ansJR<-with(vaccine.trial,
          sensitivityJR(z=treatment,s=hiv.outcome,y=logVL,
                    beta0=c(-1,-.5,-.25,0,.25,.5,1),
                    beta1=c(-1,-.5,-.25,0,.25,.5,1),
                    phi=c(0.95,0.90), selection="infected",
                    groupings=c("placebo","vaccine"),
                    N.boot=50)
         )

plot(ansJR)

ans<-with(vaccine.trial,
          sensitivityGBH(z=treatment,s=hiv.outcome,y=logVL,
                    beta=c(-Inf,-1,0.75,-0.5,-0.25,0,.25,.5,.75,1,Inf),
                    selection="infected",
                    groupings=c("placebo","vaccine"),
                    empty.principal.stratum=c("not infected","infected"),
                    ci.method="bootstrap", ci=c(0.95, 0.9, 0.9),
                    ci.type=c("twoSided", "upper", "lower"),
                    custom.FUN=function(mu0, mu1, ...) mu1 - mu0,
                    N.boot=50, method=c("ACE", "T1", "T2"),
                    upperTest=TRUE, lowerTest=TRUE, twoSidedTest=TRUE)
         )

plot(ans, ci.select="all", bootstrap.col=c("red","green","blue"))



