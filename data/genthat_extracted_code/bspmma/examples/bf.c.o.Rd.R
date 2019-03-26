library(bspmma)


### Name: bf.c.o
### Title: Compute Bayes Factors for Conditional vs. Ordinary Dirichlet
###   Models
### Aliases: bf.c.o

### ** Examples

## Not run: 
##D ##  CPU times are from runs of the R command system.time() on an
##D ##  Intel $2.8$ GHz Q$9550$ running Linux.
##D ## Preliminary steps
##D 
##D data(breast.17) # the breast cancer dataset
##D breast.data <- as.matrix(breast.17) # put data in matrix object
##D chain1.list <- bf1(breast.data) # 40.5 secs
##D cc <- bf2(chain1.list) # 1.6 secs
##D ## Next get a second set of 9 chains, with a different seed
##D chain2.list <- bf1(breast.data,seed=2) # 40.4 secs
##D 
##D ## OR load the chains and constants saved earlier
##D load("breast-rdat-2lists-1000")
##D load("breast-rdat-2lists-1000")
##D 
##D ## Compute and plot the Bayes factors
##D breast.bfco <- bf.c.o(to=20, cc=cc, mat.list=chain2.list) # 107 secs
##D draw.bf(breast.bfco)
## End(Not run)



