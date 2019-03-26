library(DoTC)


### Name: wrapFKM
### Title: Wrapper for 'FKM'
### Aliases: wrapFKM

### ** Examples

## Not run: 
##D ## Load and standardize (by column) data:
##D d <- read.csv("data_file.csv")
##D d <- apply(d, MAR = 2, FUN = scale)
##D ## Set maximal number of clusters:
##D K <- 10
##D ## Set random seed:
##D set.seed(1604)
##D ## Get k-means-clustering solutions as starting values:
##D start <- getStart(d = d, K = K)
##D ## Proposal vector for fuzziness parameter m:
##D m_proposal <- seq(1.1, 2.5, by = 0.1)
##D ## Calculate results of fuzzy clustering:
##D fkm_result <- wrapFKM(d = d, m = m_proposal, start = start)
##D ## Plot cluster solution across varying m:
##D plotNcluster(fkm = fkm_result)
##D ## Plot distribution of typicality coefficients:
##D plotTC(fkm_result[[1]])
##D ## Plot pairwise cluster segregation comparisons:
##D plotCS(fkm_result[[1]])
## End(Not run)



