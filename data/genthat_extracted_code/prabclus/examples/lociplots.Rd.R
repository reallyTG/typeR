library(prabclus)


### Name: lociplots
### Title: Visualises clusters of markers vs. species
### Aliases: lociplots
### Keywords: cluster

### ** Examples

## No test: 
  options(digits=4)
  data(veronica)
  vei <- prabinit(prabmatrix=veronica[1:50,],distance="jaccard")
  ppv <- prabclust(vei)
  veloci <- prabinit(prabmatrix=veronica[1:50,],rows.are.species=FALSE)
  velociclust <- prabclust(veloci,nnk=0)
  lociplots(ppv,velociclust$clustering,veloci,lcluster=3)
## End(No test)



