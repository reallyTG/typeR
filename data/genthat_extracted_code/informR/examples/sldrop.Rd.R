library(informR)


### Name: sldrop
### Title: Drop S-form Statistics or Covariates from a Statslist Array
### Aliases: sldrop

### ** Examples


#Take example from slbind.cov
example(slbind.cov)
statslist.new<-slbind.cov(covar,beta.ints)
statslist.new[[1]][[1]][,1,]

#And removes the "smokes" variable
dimnames(statslist.new[[1]][[1]])[[3]]
statslist.old<-sldrop(statslist.new,"smokes")
dimnames(statslist.old[[1]][[1]])[[3]]



