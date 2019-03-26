library(MultiLCIRT)


### Name: MultiLCIRT-package
### Title: Multidimensional Latent Class (LC) Item Response Theory (IRT)
###   Models
### Aliases: MultiLCIRT-package MultiLCIRT
### Keywords: package

### ** Examples

## Estimation of different Multidimensional LC IRT models with binary
## responses
# Aggregate data
data(naep)
X = as.matrix(naep)
out = aggr_data(X)
S = out$data_dis
yv = out$freq
# Define matrix to allocate each item on one dimension 
multi1 = rbind(c(1,2,9,10),c(3,5,8,11),c(4,6,7,12))
# Three-dimensional LC Rasch model with 4 latent classes
# less severe tolerance level to check convergence (to be modified)
out1 = est_multi_poly(S,yv,k=4,start=0,link=1,multi=multi1,tol=10^-6)



