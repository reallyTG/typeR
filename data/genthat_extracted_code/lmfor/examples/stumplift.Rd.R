library(lmfor)


### Name: stumplift
### Title: Productivity of stump lifting machines.
### Aliases: stumplift
### Keywords: datasets

### ** Examples

data(stumplift)
library(nlme)

modConstPow<-gls(Productivity~Machine+Machine*I((Diameter-70)^2),
                 data=stumplift,
                 weights=varPower(),
                 corr=corAR1(form=~Stump|Machine))
           



