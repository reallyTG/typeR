library(modesto)


### Name: ETCt
### Title: Tool to computate the Expected Total Cost vector for a
###   Continuous Time Markov Chain, CTMC.
### Aliases: ETCt

### ** Examples

library(modesto)
R <- matrix(c(0,1,0,0,0, 1/72,0,1,0,0, 0,2/72,0,1,0, 0,0,3/72,0,1/2, 0,0,0,4/72,0),5,5,byrow=TRUE)
ETCt(R,c(-80,-15,50,125,200),t=24,epsilon=0.001) # A four states CTMC example



