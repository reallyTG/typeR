library(restrictedMVN)


### Name: restrictedMVN-package
### Title: Sampler from multivariate normal with affine constraints
### Aliases: restrictedMVN-package restrictedMVN
### Keywords: package

### ** Examples

constr = thresh2constraints(3, lower = c(0.2,0.2,0.2))
covariance = matrix(c(1,0.5,0,0.5,1,0.5,0,0.5,1),nc=3)
 
samp = sample_from_constraints(linear_part = constr$linear_part,
                                    offset= constr$offset,
                                    mean_param = c(0,0,0),
                                    covariance = covariance,
                                    initial_point = c(1,1,1), 
                                    ndraw=20000,
                                    burnin=2000)


# all points should be >= 0.2 
stopifnot(all(samp>=0.2))

mean_restricted = colMeans(samp)

# compare to rejection of multivariate normals
library("MASS")
full_samp = mvrnorm(n=100000,mu = c(0,0,0),Sigma = covariance)
# Add restrictions:
pass_restrictions = apply(full_samp, 1, 
          function(x){all(constr$linear_part%*% x - constr$offset <=0 )})
          
cond_samp = full_samp[pass_restrictions,]
mean_restricted_rej = colMeans(cond_samp)

stopifnot(all(abs(mean_restricted - mean_restricted_rej)<=0.05))



