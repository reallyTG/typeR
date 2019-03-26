library(modesto)


### Name: LRC
### Title: Tool to computate the Long-Run Cost Rate for a Continuous Time
###   Markov Chain, CTMC.
### Aliases: LRC

### ** Examples

## Not run: 
##D library(modesto)
##D R <- matrix(c(0,1,0,0,0, 1/72,0,1,0,0, 0,2/72,0,1,0, 0,0,3/72,0,1/2, 0,0,0,4/72,0),5,5,byrow=TRUE)
##D LRC(X=R,costs=c(-80,-15,50,125,200)) # A five states CTMC example
## End(Not run)



