library(DNAtools)


### Name: dbExpect
### Title: Expected value of cell counts in DNA database comparison
### Aliases: dbExpect

### ** Examples

  ## Not run: 
##D   ## Simulate some allele frequencies:
##D   freqs <-  replicate(10, { g = rgamma(n=10,scale=4,shape=3); g/sum(g)},
##D               simplify=FALSE)
##D   ## Compute the expected number for a DB with 10000 profiles:
##D   dbExpect(freqs,theta=0,n=10000)
##D   
## End(Not run) 



