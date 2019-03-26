library(expoTree)


### Name: expoTree-package
### Title: Calculate density dependent likelihood of a phylogenetic tree
### Aliases: expoTree-package expoTree
### Keywords: phylodynamics

### ** Examples

  # simulate trees
  N <- 15
  beta <- 1
  mu <- 0.1
  psi <- 0.1
  rho <- 0
  nsamp <- 20
  epis <- lapply(1:2,function(x) sim.epi(N,beta,mu,psi,nsamp))
  forest <- lapply(epis,function(x) cbind(x$times,x$ttypes))

  # plot lineages-through-time
  plotLTT(forest)

  extant <- sapply(forest,function(t) sum(2*t[,2]-1))
  lineages <- lapply(forest,function(t) sum(2*t[,2]-1)+cumsum(1-2*t[,2]))
  max.lineages <- sapply(lineages,max)

  # calculate likelihood for the forest
  lik <- sapply(forest,function(tree) {
    runExpoTree(matrix(c(N,beta,mu,psi,rho),nrow=1),tree[,1],tree[,2])
  })
  cat("Likelihood = ",sum(lik),"\n")

  if (! is.nan(sum(lik))) {
    # Find optimal parameters
    (opt <- expoTree.optim(forest,pars=c(N,beta,psi),
                   lo=c(max(max.lineages),0,0),hi=c(50,3,1),
                   fix=c(FALSE,FALSE,TRUE,FALSE,TRUE),
                   fix.val=c(0,0,-psi/(psi+mu),0,0)))
  }



