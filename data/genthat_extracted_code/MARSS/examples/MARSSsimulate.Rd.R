library(MARSS)


### Name: MARSSsimulate
### Title: Simulate Data from a MARSS Model
### Aliases: MARSSsimulate simulate.marssMLE

### ** Examples

  d = harborSeal[,c(2,11)]
  dat = t(d)
  MLEobj = MARSS(dat)

  #simulate data that are the 
  #same length as original data and no missing data
  sim.obj = MARSSsimulate(MLEobj, tSteps=dim(d)[1], nsim=5)
  
  #simulate data that are the 
  #same length as original data and have missing data in the same location
  sim.obj = MARSSsimulate(MLEobj, tSteps=dim(d)[1], nsim=5, miss.loc=dat)




