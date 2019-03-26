library(glmmBUGS)


### Name: winBugsRaggedArray
### Title: Ragged Arrays for multilevel models in BUGS
### Aliases: winBugsRaggedArray

### ** Examples

library(nlme)
data(Muscle)
muscleRagged = winBugsRaggedArray(Muscle, effects="Strip",  
observations="conc",
  covariates=list(observations="length"))




