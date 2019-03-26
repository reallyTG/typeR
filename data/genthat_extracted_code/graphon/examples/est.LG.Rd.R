library(graphon)


### Name: est.LG
### Title: Estimate graphons based on empirical degrees
### Aliases: est.LG

### ** Examples

## No test: 
## generate a graphon of type No.10 with 3 clusters
W = gmodel.preset(3,id=10)

## create a probability matrix for 100 nodes
graphW = gmodel.block(W,n=100)
P = graphW$P

## draw 23 observations from a given probability matrix
A = gmodel.P(P,rep=23)

## run LG algorithm with a rough guess for K=2,3,4
res2 = est.LG(A,K=2)
res3 = est.LG(A,K=3)
res4 = est.LG(A,K=4)

## compare true probability matrix and estimated ones
par(mfrow=c(1,4))
image(P); title("main")
image(res2$P); title("LG with K=2")
image(res3$P); title("LG with K=3")
image(res4$P); title("LG with K=4")
## End(No test)




