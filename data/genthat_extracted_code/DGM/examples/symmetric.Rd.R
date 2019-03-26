library(DGM)


### Name: symmetric
### Title: Turns asymetric network into an symmetric network. Helper
###   function to determine the detection of a connection while ignoring
###   directionality.
### Aliases: symmetric

### ** Examples

M=array(NA, dim=c(3,3,2))
M[,,1]=matrix(c(0,0,0,1,0,0,0,1,0),3,3)
M[,,2]=matrix(c(0,0,0,1,0,0,0,0,0),3,3)
M_=symmetric(M)



