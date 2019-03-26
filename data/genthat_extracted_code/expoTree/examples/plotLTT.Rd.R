library(expoTree)


### Name: plotLTT
### Title: Plot lineages through time.
### Aliases: plotLTT
### Keywords: likelihood phylogenetics

### ** Examples

  N <- 100
  beta <- 1
  mu <- 0.1
  psi <- 0.4
  nsamp <- 100

  epis <- lapply(1:10,function(i) sim.epi(N,beta,mu,psi,nsamp))
  trees <- lapply(epis,function(x) cbind(x$times,x$ttypes))
  plotLTT(trees)



