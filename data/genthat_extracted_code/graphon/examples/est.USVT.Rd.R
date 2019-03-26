library(graphon)


### Name: est.USVT
### Title: Estimate graphons based via Universal Singular Value
###   Thresholding
### Aliases: est.USVT

### ** Examples

## No test: 
## generate a graphon of type No.1 with 3 clusters
W = gmodel.preset(3,id=1)

## create a probability matrix for 100 nodes
graphW = gmodel.block(W,n=100)
P = graphW$P

## draw 5 observations from a given probability matrix
A = gmodel.P(P,rep=5,symmetric.out=TRUE)

## run USVT algorithm with different eta values (0.01,0.1)
res2 = est.USVT(A,eta=0.01)
res3 = est.USVT(A,eta=0.1)

## compare true probability matrix and estimated ones
par(mfrow=c(1,3))
image(P); title("original P")
image(res2$P); title("USVT with eta = 0.01")
image(res3$P); title("USVT with eta = 0.1")
## End(No test)




