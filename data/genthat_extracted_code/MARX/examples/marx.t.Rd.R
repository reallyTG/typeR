library(MARX)


### Name: marx.t
### Title: The estimation of the MARX model by t-MLE function
### Aliases: marx.t
### Keywords: causal-noncausal estimation

### ** Examples

data <- sim.marx(c('t',3,1),c('t',3,1),100,0.5,0.4,0.3)
marx.t(data$y,data$x,1,1)



