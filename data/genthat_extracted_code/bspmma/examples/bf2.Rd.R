library(bspmma)


### Name: bf2
### Title: Compute Constants for Multi-Chain Algorithm to Compute Bayes
###   Factors
### Aliases: bf2

### ** Examples

## Not run: 
##D ## Get the two sets of chains saved from runs of bf1 from
##D ## the breast cancer example in the help file for bf1.
##D load("breast-rdat-2lists-1000")
##D 
##D ## Default values ncycles=2000, burnin=1000
##D ##  CPU time is from a run of the R command system.time() on an
##D ##  Intel $2.8$ GHz Q$9550$ running Linux.
##D cc <- bf2(chain1.list) #1.6 secs
##D 
##D ## Perhaps save for another time.
##D save(cc,file="breast-rdat-constants",compress=TRUE)
##D 
##D ## Next session
##D load("breast-rdat-constants")
##D 
## End(Not run)



