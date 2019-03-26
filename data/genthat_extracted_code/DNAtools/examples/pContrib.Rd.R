library(DNAtools)


### Name: pContrib
### Title: Compute the posterior probabilities for P(m|n0) for a given
###   prior P(m) and observed vector n0 of locus counts
### Aliases: pContrib

### ** Examples

  ## Simulate some allele frequencies:
  freqs <-  structure(replicate(10, { g = rgamma(n=10,scale=4,shape=3); g/sum(g)},
              simplify=FALSE),.Names=paste("locus",1:10,sep="."))
  m <- 2
  n0 <- unlist(lapply(freqs, function(x){
      length(unique(sample(length(x),size=2*m,replace=TRUE,prob=x)))}
      ))
  ## Compute P(m|n0) for m=1,...,4 and the sampled n0
  pContrib(n0=n0,probs=freqs,m.max=4)



