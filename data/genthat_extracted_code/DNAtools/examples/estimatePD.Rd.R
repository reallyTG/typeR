library(DNAtools)


### Name: estimatePD
### Title: Estimate the drop-out probability based on number of alleles
### Aliases: estimatePD

### ** Examples

  ## Simulate some allele frequencies:
  freqs <-  structure(replicate(10, { g = rgamma(n=10,scale=4,shape=3); g/sum(g)},
              simplify=FALSE),.Names=paste("locus",1:10,sep="."))
  ## Assume 15 alleles are observed in a 2-person DNA mixture with 10 loci:
  estimatePD(n0=15,m=2,probs=freqs)



