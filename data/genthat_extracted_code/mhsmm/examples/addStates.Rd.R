library(mhsmm)


### Name: addStates
### Title: Adds a bar representing state sequence.
### Aliases: addStates

### ** Examples

  plot(rnorm(100),type='l')
  addStates(rep(c(1,2),each=50))  

  plot(seq(0.01,1,.01),rnorm(100),type='l')
  addStates(rep(c(1,2),each=50),seq(0.01,1,.01))  



