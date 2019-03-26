library(sensitivityPStrat)


### Name: print.sensitivity
### Title: prints the results of calls to the sensitivity functions.
### Aliases: print.sensitivity print.sensitivity.0d print.sensitivity.1d
### Keywords: print

### ** Examples

data(vaccine.trial)

print(with(vaccine.trial,
          sensitivityJR(z=treatment,s=hiv.outcome,y=logVL,
                    beta0=c(-1,-.75,-.5,-.25,0,.25,.5,.75,1),
                    beta1=c(-1,-.75,-.5,-.25,0,.25,.5,.75,1),
                    phi=c(0.95,0.90), selection="infected",
                    groupings=c("placebo","vaccine"),
                    N.boot=50)
         ))




