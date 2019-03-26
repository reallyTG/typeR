library(bspmma)


### Name: bf.o
### Title: Compute Bayes Factors for Comparing Values of the Dirichlet
###   Precision Parameter in the Ordinary Dirichlet Model
### Aliases: bf.o

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
##D ## Compute and plot the Bayes factors
##D breast.bfo <- bf.o(to=20, cc=cc, mat.list=chain2.list) #51 secs
##D draw.bf(breast.bfo)
## End(Not run)



