library(DNAtools)


### Name: noaTabs
### Title: Computes the alpha_m variants and their weights.
### Aliases: noaTabs

### ** Examples

  ## Simulate some allele frequencies:
  freqs <-  structure(replicate(10, { g = rgamma(n=10,scale=4,shape=3); g/sum(g)},
              simplify=FALSE),.Names=paste("locus",1:10,sep="."))
  ## Compute alpha_2
  noa.tab2 <- noaTabs(m=2)
  ## Use alpha_2 to compute alpha_3
  noa.tab3 <- noaTabs(alpha=noa.tab2, m=3)

  ## Compute P(N(m=3)=n), n=1,...,2*L*m, where L=10 here
  pNoA(freqs,m=3,theta=0,noa.tabs=noa.tab3)
  ## Same, but locuswise results
  pNoA(freqs,m=3,theta=0,noa.tabs=noa.tab3,locuswise=TRUE)



