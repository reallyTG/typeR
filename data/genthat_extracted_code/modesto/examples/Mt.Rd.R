library(modesto)


### Name: Mt
### Title: Tool to computate the Occupancy Matrix for a Continuous Time
###   Markov Chain, CTMC.
### Aliases: Mt

### ** Examples

library(modesto)
R <- matrix(c(0,1,0,0,0, 1/72,0,1,0,0, 0,2/72,0,1,0, 0,0,3/72,0,1/2, 0,0,0,4/72,0),5,5,byrow=TRUE)
Mt(R,t=24,epsilon=0.005) # A five states CTMC example



