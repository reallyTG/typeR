library(MultiLCIRT)


### Name: test_dim
### Title: Likelihood ratio testing between nested multidimensional LC IRT
###   models
### Aliases: test_dim
### Keywords: likelihood ratio testing

### ** Examples

## Computation of the LR statistic testing unidimensionality on HADS data
# Aggregate data
data(hads)
X = as.matrix(hads)
out = aggr_data(X)
S = out$data_dis
yv = out$freq
# Define matrix to allocate each item on one dimension 
multi1 = rbind(c(2,6,7,8,10,11,12),c(1,3,4,5,9,13,14))
# Compare unidimensional vs bidimensional Graded Response models with free
# discrimination and free difficulty parameters
# with less severe tollerance level (to be increased)
out = test_dim(S,yv,k=3,link=1,disc=1,multi1=multi1,tol=5*10^-4)



