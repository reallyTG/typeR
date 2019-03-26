library(EBPRS)


### Name: generateScore
### Title: Calculate the polygenic risk scores
### Aliases: generateScore

### ** Examples

S <- generateScore(sigmaHat2=rep(1,100),muHat=rep(0.1,100),
X=matrix(sample(0:1,size=1000,replace=TRUE),10,100) )



