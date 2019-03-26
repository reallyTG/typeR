library(qualityTools)


### Name: rsmDesign
### Title: Generate a response surface design (i.e. central composite
###   design)
### Aliases: rsmDesign
### Keywords: Design of Experiments Six Sigma

### ** Examples

#central composite design for 2 factors with 2 blocks, alpha = 1.41, 
#5 centerpoints in the cube portion and 3 centerpoints in the star portion:
rsmDesign(k = 2, blocks = 2, alpha = sqrt(2),cc = 5, cs = 3)

#central composite design with both, orthogonality and near rotatability 
rsmDesign(k = 2, blocks = 2, alpha = "both")

#central composite design with
#2 centerpoints in the factorial portion of the design i.e 2
#1 centerpoint int the star portion of the design i.e. 1
#2 replications per factorial point i.e. 2^3*2 = 16
#3 replications per star points 3*2*3 = 18
#makes a total of 37 factor combinations
rsdo = rsmDesign(k = 3, blocks = 1, alpha = 2, cc = 2, cs = 1, fp = 2, sp = 3)
nrow(rsdo) #37



