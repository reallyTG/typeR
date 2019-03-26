library(graphon)


### Name: est.SBA
### Title: Estimate graphons based on Stochastic Blockmodel approximation
### Aliases: est.SBA

### ** Examples

## No test: 
## generate a graphon of type No.6 with 3 clusters
W = gmodel.preset(3,id=6)

## create a probability matrix for 100 nodes
graphW = gmodel.block(W,n=100)
P = graphW$P

## draw 17 observations from a given probability matrix
A = gmodel.P(P,rep=17)

## run SBA algorithm with different deltas (0.2,0.5,0.8)
res2 = est.SBA(A,delta=0.2)
res3 = est.SBA(A,delta=0.5)
res4 = est.SBA(A,delta=0.8)

## compare true probability matrix and estimated ones
par(mfrow=c(1,4))
image(P); title("original P")
image(res2$P); title("SBA with delta=0.2")
image(res3$P); title("SBA with delta=0.5")
image(res4$P); title("SBA with delta=0.8")
## End(No test)




