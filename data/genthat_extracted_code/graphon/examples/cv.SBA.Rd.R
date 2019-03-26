library(graphon)


### Name: cv.SBA
### Title: Cross validation for selecting optimal precision parameter in
###   SBA method.
### Aliases: cv.SBA

### ** Examples

## Not run: 
##D ## generate a graphon of type No.8 with 3 clusters
##D W = gmodel.preset(3,id=8)
##D 
##D ## create a probability matrix for 100 nodes
##D graphW = gmodel.block(W,n=100)
##D P = graphW$P
##D 
##D ## draw 15 observations from a given probability matrix
##D A = gmodel.P(P,rep=15)
##D 
##D ## cross validate SBA algorithm over different deltas
##D rescv = cv.SBA(A,vecdelta=c(0.1,0.5,0.9))
##D print(rescv$optdelta)
## End(Not run)





