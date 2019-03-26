library(DNAtools)


### Name: dbVariance
### Title: Covariance matrix of cell counts in DNA database comparison
### Aliases: dbVariance

### ** Examples

  ## Not run: 
##D   ## Simulate some allele frequencies:
##D   freqs <-  replicate(10, { g = rgamma(n=10,scale=4,shape=3); g/sum(g)}, simplify=FALSE)
##D   ## List of elements needed to compute the covariance matrix.
##D   ## Useful option when the covariance needs to be computed for varying
##D   ## database sizes but for identical theta-value.
##D   comps <- dbVariance(freqs,theta=0,n=1)
##D   ## Covariance for a DB with 1000 DNA profiles
##D   cov1000 <- dbVariance(freqs,theta=0,n=1000)
##D   ## The result is the same as:
##D   comps1000 <- choose(1000,2)*comps$V1 + 6*choose(1000,3)*comps$V2 + 6*choose(1000,4)*comps$V3
##D   
## End(Not run)



