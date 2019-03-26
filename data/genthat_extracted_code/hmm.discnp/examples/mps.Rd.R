library(hmm.discnp)


### Name: mps
### Title: Most probable states.
### Aliases: mps
### Keywords: models

### ** Examples

# See the help for rhmm() for how to generate y.num.
## Not run: 
##D fit.num <- hmm(y.num,K=2,verb=TRUE)
##D s.1 <- mps(y.num,fit.num)
##D s.2 <- mps(y.num,tpm=P,ispd=c(0.25,0.75),Rho=R) # P and R as in the help
##D                                                 # for rhmm().
##D # The order of the states has gotten swapped; (3 - s.1[,1]) is much
##D # more similar to s.2[,1] than is s.1[,1].
## End(Not run)



