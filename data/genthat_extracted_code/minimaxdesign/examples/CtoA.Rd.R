library(minimaxdesign)


### Name: CtoA
### Title: Inverse Rosenblatt transformation from the unit hypercube to the
###   unit simplex
### Aliases: CtoA

### ** Examples

  ## Not run: 
##D     # Map the first 100 points of the Sobol' sequence in 3D
##D     #   onto the unit simplex in 3D
##D     library(randtoolbox)
##D     des <- sobol(100,3)
##D     des_simp <- CtoA(des)
##D 
##D     pairs(des_simp,xlim=c(0,1),ylim=c(0,1),pch=16)
##D 
##D   
## End(Not run)



