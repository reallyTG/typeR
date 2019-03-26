library(minimaxdesign)


### Name: CtoB
### Title: Inverse Rosenblatt transformation from the unit hypercube to the
###   unit ball.
### Aliases: CtoB

### ** Examples

  ## Not run: 
##D     # Map the first 100 points of the Sobol' sequence in 3D
##D     #   onto the unit ball in 3D
##D     library(randtoolbox)
##D     des <- sobol(100,3)
##D     des_ball <- CtoB(des)
##D 
##D     pairs(des_ball,xlim=c(-1,1),ylim=c(-1,1),pch=16)
##D 
##D   
## End(Not run)



