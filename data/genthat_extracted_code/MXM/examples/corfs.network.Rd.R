library(MXM)


### Name: Network construction using the partial correlation based forward regression or FBED
### Title: Network construction using the partial correlation based forward
###   regression of FBED
### Aliases: corfs.network corfbed.network
### Keywords: Network construction forward regression

### ** Examples

# simulate a dataset with continuous data
dataset <- matrix(runif(1000 * 50, 1, 100), nrow = 1000 ) 
a1 <- mmhc.skel(dataset, max_k = 3, threshold = 0.05, test = "testIndFisher", 
nc = 1) 
a2 <- corfs.network(dataset, threshold = 0.05, tolb = 2, tolr = 0.02, stopping = "BIC", 
symmetry = TRUE, nc = 1) 
a1$runtime  
a2$runtime 



