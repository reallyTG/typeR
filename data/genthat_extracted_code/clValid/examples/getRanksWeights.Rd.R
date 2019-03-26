library(clValid)


### Name: getRanksWeights
### Title: Extract ranks and weights from clValid object
### Aliases: getRanksWeights
### Keywords: cluster

### ** Examples

data(mouse)
express <- mouse[1:25,c("M1","M2","M3","NC1","NC2","NC3")]
rownames(express) <- mouse$ID[1:25]
clv <- clValid(express, 4:6, clMethods=c("hierarchical","kmeans","pam"), 
                  validation=c("internal","stability"))
res <- getRanksWeights(clv)
if(require("RankAggreg")) {
  CEWS <- RankAggreg(x=res$ranks, k=5, weights=res$weights, seed=123, verbose=FALSE)
  CEWS
}



