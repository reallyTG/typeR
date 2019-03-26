library(graphon)


### Name: est.nbdsmooth
### Title: Estimate edge probabilities by neighborhood smoothing
### Aliases: est.nbdsmooth

### ** Examples

## No test: 
## generate a graphon of type No.4 with 3 clusters
W = gmodel.preset(3,id=4)

## create a probability matrix for 100 nodes
graphW = gmodel.block(W,n=100)
P = graphW$P

## draw 5 observations from a given probability matrix
A = gmodel.P(P,rep=5,symmetric.out=TRUE)

## run nbdsmooth algorithm
res2 = est.nbdsmooth(A)

## compare true probability matrix and estimated ones
par(mfrow=c(1,2))
image(P); title("original P")
image(res2$P); title("nbdsmooth estimated P")
## End(No test)




