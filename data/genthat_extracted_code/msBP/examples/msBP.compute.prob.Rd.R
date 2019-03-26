library(msBP)


### Name: msBP.compute.prob
### Title: Compute binary tree of probabilities
### Aliases: msBP.compute.prob

### ** Examples

S <-structure(list( T = list(1/8,c(1/3,1/3), c(1/4,1/4,1/4,1/4), 
	rep(1,8)), max.s=3), class  = "binaryTree")
R <-structure(list( T = list(1/2,c(1/2,1/2), c(1/4,1/2,1/2,1/2), 
	rep(1,8)), max.s=3), class  = "binaryTree")
RS <-structure(list(S = S, R = R), class  = "msbpTree")
probabilities <- msBP.compute.prob(RS)



