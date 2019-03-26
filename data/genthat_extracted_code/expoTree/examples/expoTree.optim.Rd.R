library(expoTree)


### Name: expoTree.optim
### Title: Perform optimization to find a maximum likelihood estimate.
### Aliases: expoTree.optim
### Keywords: likelihood phylogenetics

### ** Examples

  # simulate trees
  N <- 15
  beta <- 1
  mu <- 0.1
  psi <- 0.1
  rho <- 0
  nsamp <- 20
  epi <- sim.epi(N,beta,mu,psi,nsamp)
  tree <- cbind(epi$times,epi$ttypes)

  extant <- sum(2*tree[,2]-1)
  lineages <- sum(2*tree[,2]-1)+cumsum(1-2*tree[,2])
  max.lineages <- max(lineages)

  # calculate likelihood for the forest
  lik <- runExpoTree(pars=c(N,beta,mu,psi,rho),times=tree[,1],ttypes=tree[,2],
                     survival=TRUE,return.full=FALSE)
  cat("Likelihood = ",lik,"\n")

  if (! any(is.nan(lik))) {
    expoTree.optim(list(tree),pars=c(N,beta,psi),
                   lo=c(max(max.lineages),0,0),hi=c(50,3,1),
                   fix=c(FALSE,FALSE,TRUE,FALSE,TRUE),
                   fix.val=c(0,0,-psi/(psi+mu),0,0))
  }



