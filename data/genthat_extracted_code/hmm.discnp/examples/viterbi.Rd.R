library(hmm.discnp)


### Name: viterbi
### Title: Most probable state sequence.
### Aliases: viterbi
### Keywords: models

### ** Examples

# See the help for rhmm() for how to generate y.num and y.let.
## Not run: 
##D fit.num <- hmm(y.num,K=2,verb=TRUE)
##D v.1 <- viterbi(model=fit.num)
##D v.2 <- viterbi(y.num,tpm=P,Rho=R) # P and R as in the
##D                                   # help for rhmm().
##D # The order of the states has gotten swapped; 3-v.1[[1]] is much
##D # more similar to v.2[[1]] than is v.1[[1]].
##D 
##D fit.let <- hmm(y.let,K=2,verb=TRUE)
##D v.3 <- viterbi(model=fit.let)    # Works.
##D v.4 <- viterbi(y.let,tpm=P,Rho=R) # Throws an error (R has no row names.)
## End(Not run)



