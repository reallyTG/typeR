library(glmmBUGS)


### Name: glmmPQLstrings
### Title: An alternat interface to glmmPQL
### Aliases: glmmPQLstrings

### ** Examples

library(nlme)
data(Muscle)
glmmPQLstrings(effects="Strip",  observations="conc",
  covariates=list(observations="length") ,
  data=Muscle, family="gaussian")



