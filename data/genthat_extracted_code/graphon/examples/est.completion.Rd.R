library(graphon)


### Name: est.completion
### Title: Estimate graphons based on matrix completion scheme
### Aliases: est.completion

### ** Examples

## Not run: 
##D ## generate a graphon of type No.5 with 3 clusters
##D W = gmodel.preset(3,id=5)
##D 
##D ## create a probability matrix for 100 nodes
##D graphW = gmodel.block(W,n=100)
##D P = graphW$P
##D 
##D ## draw 10 observations from a given probability matrix
##D A = gmodel.P(P,rep=10)
##D 
##D ## apply the method
##D res_r3 = est.completion(A,rank=3)       # use rank-3 approximation
##D res_r9 = est.completion(A,rank=9)       # use rank-9 approximation
##D res_rN = est.completion(A,adjust=FALSE) # stop the code if guess works poorly
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D image(res_r3); title("rank 3")
##D image(res_r9); title("rank 9")
##D image(res_rN); title("guessed rank")
## End(Not run)




