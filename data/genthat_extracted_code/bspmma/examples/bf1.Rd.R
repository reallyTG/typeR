library(bspmma)


### Name: bf1
### Title: Generate Chains for Computation of Bayes Factors
### Aliases: bf1

### ** Examples

## Not run: 
##D ## Set up the data.
##D 
##D data(breast.17) # the breast cancer dataset
##D breast.data <- as.matrix(breast.17) # put data in matrix object
##D 
##D ## Default values ncycles=2000, burnin=1000, seed=1
##D ##  CPU time is given from a run of the R command system.time() on an
##D ##  Intel $2.8$ GHz Q$9550$ running Linux
##D chain1.list <- bf1(breast.data) # 40.5 secs
##D ## Next get a second set of 9 chains, with a different seed 
##D chain2.list <- bf2(breast.data, seed=2) # 40.4 secs
##D 
##D ## Perhaps save for another time.
##D save(chain1.list,chain2.list,file="breast-rdat-2lists-1000",compress=TRUE)
##D 
##D ## later session
##D load("breast-rdat-2lists-1000")
##D 
## End(Not run)



