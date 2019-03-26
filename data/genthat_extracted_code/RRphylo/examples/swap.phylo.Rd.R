library(RRphylo)


### Name: swap.phylo
### Title: Test the effect of phylogenetic uncertainty on rate shifts found
###   at a particular node
### Aliases: swap.phylo

### ** Examples

  data("DataApes")
  DataApes$PCstage->PCstage
  DataApes$Tstage->Tstage
  DataApes$CentroidSize->CS

## No test: 
# Case 1. swap.phylo without accounting for the effect of a covariate
  RRphylo(tree=Tstage,y=PCstage)->RR
  RR$rates->rr
  swap.phylo(Tstage,node=61,y=PCstage,rts=rr)
# Case 2. swap.phylo accounting for the effect of a covariate
  RRphylo(tree=Tstage,y=CS)->RRcova
  c(RRcova$aces,CS)->cov.values
  c(rownames(RRcova$aces),names(CS))->names(cov.values)
  RRphylo(tree=Tstage,y=PCstage,cov=cov.values)->RR
  RR$rates->rr
  swap.phylo(Tstage,node=61,y=PCstage,rts=rr,cov=CS)
## End(No test)



