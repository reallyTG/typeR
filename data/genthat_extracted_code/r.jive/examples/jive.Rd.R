library(r.jive)


### Name: jive
### Title: JIVE Decomposition for Multi-source Data
### Aliases: jive jive.iter bic.jive jive.perm

### ** Examples

## Not run: 
##D set.seed(10)
##D ##Load data that were simulated as in Section 2.4 of Lock et al., 2013,
##D ##with rank 1 joint structure, and rank 1 individual structure for each dataset
##D data(SimData) 
##D # Using default method ("perm")
##D Results <- jive(SimData)
##D summary(Results)
##D 
##D # Using BIC rank selection
##D #We set the maximum number of iterations allowed to 50 to speed up this example.  
##D #In practice we recommend a higher value, such as the default of 1000, 
##D #to ensure that all results converge.
##D BIC_result <- jive(SimData,method="bic",maxiter=50)  
##D summary(BIC_result)
## End(Not run)



