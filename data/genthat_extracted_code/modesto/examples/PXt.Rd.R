library(modesto)


### Name: PXt
### Title: Tool to computate the transient probability distribution for a
###   Continuous Time Markov Chain, CTMC.
### Aliases: PXt

### ** Examples

library(modesto)
R <- matrix(c(0,2,0,3,0,1,0,6,0),3,3,byrow=TRUE)
X0 <- c(1,0,0)
PXt(X0,R,t=0.5,epsilon=0.01) # A three states CTMC example



