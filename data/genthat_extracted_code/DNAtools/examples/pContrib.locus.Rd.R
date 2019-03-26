library(DNAtools)


### Name: pContrib.locus
### Title: Compute the posterior probabilities for P(m|n0) for a given
###   prior P(m)
### Aliases: pContrib.locus

### ** Examples

  ## Simulate some allele frequencies:
  freqs <-  structure(replicate(10, { g = rgamma(n=10,scale=4,shape=3); g/sum(g)},
              simplify=FALSE),.Names=paste("locus",1:10,sep="."))
  ## Compute P(m|n0) for m=1,...,5 and n0=1,...10 for the first locus:
  pContrib.locus(prob=freqs[[1]],m.max=5)



