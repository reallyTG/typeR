library(steadyICA)


### Name: frobICA
### Title: match mixing matrices or ICs and calculate their Frobenius
###   distance
### Aliases: frobICA
### Keywords: ICA distance

### ** Examples

mat1 <- matrix(rnorm(4*6),nrow=4)
perm <- matrix(c(-1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,1),4,4)
mat2 <- perm%*%mat1
sqrt(sum((mat1-mat2)^2))
frobICA(M1=mat1,M2=mat2)

#Another example showing invariance to permutations:
covMat <- t(mat1)%*%mat1
mvsample <- matrix(rnorm(400),100,4)%*%mat1
frobICA(M1=cov(mvsample),M2=covMat)
frobICA(M1=cov(mvsample),M2=covMat[sample(1:6),])

#Example using independent components:
nObs=300
simS<-cbind(rgamma(nObs, shape = 1, scale = 2),
            rgamma(nObs, shape = 3, scale = 2),
            rgamma(nObs, shape = 3, scale = 2),
            rgamma(nObs, shape = 9, scale = 0.5))
              
#not necessary in this example, but this should be done when used with ICA:            
simS <- apply(simS,2,scale) 
frobICA(S1=simS,S2=simS%*%perm)
## Not run: 
##D #returns an error if S1 and S2 are not explicitly defined:
##D frobICA(simS,simS%*%perm)            
## End(Not run)            




