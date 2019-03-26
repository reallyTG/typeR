library(Oncotree)


### Name: distribution.oncotree
### Title: Find the event distribution defined by an oncogenetic tree
### Aliases: distribution.oncotree marginal.distr
### Keywords: models distribution

### ** Examples

   data(ov.cgh)
   ov.tree <- oncotree.fit(ov.cgh)
   
   #joint distribution
   jj <- distribution.oncotree(ov.tree, edge.weights="obs")
   head(jj)
   jj.eps <- distribution.oncotree(ov.tree, with.errors=TRUE)
   head(jj.eps)
  
   #marginal distribution
   marginal.distr(ov.tree, with.error=FALSE)
   #marginal distribution calculated from the joint
   apply(jj[1:ov.tree$nmut], 2, function(x){sum(x*jj$Prob)})
   
   ##Same with errors incorporated
   #marginal distribution
   marginal.distr(ov.tree, with.error=TRUE)
   #marginal distribution calculated from the joint
   apply(jj.eps[1:ov.tree$nmut], 2, function(x){sum(x*jj.eps$Prob)})
   



