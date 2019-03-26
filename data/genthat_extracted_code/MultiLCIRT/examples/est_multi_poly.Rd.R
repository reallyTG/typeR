library(MultiLCIRT)


### Name: est_multi_poly
### Title: Estimate multidimensional LC IRT model for dichotomous and
###   polytomous responses
### Aliases: est_multi_poly
### Keywords: maximum likelihood estimation Expectation-Maximization
###   algorithm

### ** Examples

## Estimation of different Multidimensional LC IRT models with binary
# responses
# Aggregate data
data(naep)
X = as.matrix(naep)
out = aggr_data(X)
S = out$data_dis
yv = out$freq
# Define matrix to allocate each item to one dimension 
multi1 = rbind(c(1,2,9,10),c(3,5,8,11),c(4,6,7,12))
# Three-dimensional Rasch model with 3 latent classes
# the tolerance level has been rise to increase the speed (to be reported
# to a smaller value)
out1 = est_multi_poly(S,yv,k=3,start=0,link=1,multi=multi1,tol=10^-6)
## Not run: 
##D # Three-dimensional 2PL model with 3 latent classes
##D out2 = est_multi_poly(S,yv,k=3,start=0,link=1,disc=1,multi=multi1)
## End(Not run)

## Not run: 
##D ## Estimation of different Multidimensional LC IRT models with ordinal
##D # responses
##D # Aggregate data
##D data(hads)
##D X = as.matrix(hads)
##D out = aggr_data(X)
##D S = out$data_dis
##D yv = out$freq
##D # Define matrix to allocate each item to one dimension 
##D multi1 = rbind(c(2,6,7,8,10,11,12),c(1,3,4,5,9,13,14))
##D # Bidimensional LC Graded Response Model with 3 latent classes 
##D # (free discriminating and free difficulty parameters)
##D out1 = est_multi_poly(S,yv,k=3,start=0,link=1,disc=1,multi=multi1)
##D # Bidimensional LC Partial Credit Model with 3 latent classes 
##D # (constrained discrimination and free difficulty parameters)
##D out2 = est_multi_poly(S,yv,k=3,start=0,link=2,multi=multi1)
##D # Bidimensional LC Rating Scale Model with 3 latent classes 
##D # (constrained discrimination and constrained difficulty parameters)
##D out3 = est_multi_poly(S,yv,k=3,start=0,link=2,difl=1,multi=multi1)
## End(Not run)

## Not run: 
##D ## Estimation of LC model with covariates
##D # gerate covariates
##D be = c(0,1,-1)
##D X = matrix(rnorm(2000),1000,2)
##D u = cbind(1,X)##D 
##D p = exp(u)/(1+exp(u))
##D c = 1+(runif(1000)<p)
##D Y = matrix(0,1000,5)
##D la = c(0.3,0.7)
##D for(i in 1:1000) Y[i,] = runif(5)<la[c[i]]
##D # fit the model with k=2 and k=3 classes
##D out1 = est_multi_poly(Y,k=2,X=X)
##D out2 = est_multi_poly(Y,k=3,X=X)
##D # fit model with k=2 and k=3 classes in fortran
##D out3 = est_multi_poly(Y,k=2,X=X,fort=TRUE)
##D out4 = est_multi_poly(Y,k=3,X=X,fort=TRUE)
## End(Not run)



