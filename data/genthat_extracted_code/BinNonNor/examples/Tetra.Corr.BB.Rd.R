library(BinNonNor)


### Name: Tetra.Corr.BB
### Title: Computes an tetrachoric correlation matrix for binary variables
###   given the specified correlation matrix
### Aliases: Tetra.Corr.BB

### ** Examples

n.BB=2
prop.vec=c(0.4,0.7)
corr.vec=NULL
corr.mat=matrix(c(1.0,-0.3,-0.3,-0.3,-0.3,-0.3,
-0.3,1.0,-0.3,-0.3,-0.3,-0.3,
-0.3,-0.3,1.0,0.4,0.5,0.6,
-0.3,-0.3,0.4,1.0,0.7,0.8,
-0.3,-0.3,0.5,0.7,1.0,0.9,
-0.3,-0.3,0.6,0.8,0.9,1.0),6,by=TRUE)

tetcor.mat=Tetra.Corr.BB(n.BB,prop.vec,corr.vec=NULL,corr.mat)



