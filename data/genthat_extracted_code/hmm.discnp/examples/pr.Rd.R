library(hmm.discnp)


### Name: pr
### Title: Probability of state sequences.
### Aliases: pr
### Keywords: models

### ** Examples

# See the help for rhmm() for how to generate y.num.
## Not run: 
##D fit.num <- hmm(y.num,K=2,verb=TRUE)
##D # Using fitted parmeters.
##D s.vit.1   <- viterbi(y.num,fit.num)
##D pr.vit.1  <- pr(s.vit.1,model=fit.num)
##D # Using true parameters from which y.num was generated.
##D s.vit.2   <- viterbi(y.num,tpm=P,Rho=R)
##D pr.vit.2  <- pr(s.vit.2,y.num,tpm=P,Rho=R)
## End(Not run)



