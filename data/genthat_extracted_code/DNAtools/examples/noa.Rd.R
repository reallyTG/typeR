library(DNAtools)


### Name: pNoA
### Title: The exact distribution of the number of alleles in a m-person
###   DNA mixture
### Aliases: pNoA p.numberofalleles

### ** Examples

  ## Simulate some allele frequencies:
  freqs <-  structure(replicate(10, { g = rgamma(n=10,scale=4,shape=3); g/sum(g)},
              simplify=FALSE),.Names=paste("locus",1:10,sep="."))
  ## Compute alpha_2
  noa.tab3 <- noaTabs(m=2)

  ## Compute P(N(m=3)=n), n=1,...,2*L*m, where L=10 here
  pNoA(freqs,m=2,theta=0,noa.tabs=noa.tab3)
  ## Same, but locuswise results
  pNoA(freqs,m=2,theta=0,noa.tabs=noa.tab3,locuswise=TRUE)



