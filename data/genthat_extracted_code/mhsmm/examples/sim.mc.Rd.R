library(mhsmm)


### Name: sim.mc
### Title: Markov chain simulation
### Aliases: sim.mc

### ** Examples

  p <- matrix(c(.1,.3,.6,rep(1/3,3),0,.5,.5),ncol=3,byrow=TRUE)
  init <- rep(1/3,3)
  sim.mc(init,p,10)  
  
  



