library(restrictedMVN)


### Name: sample_from_constraints
### Title: Sample from multivariate normal distribution under affine
###   restrictions
### Aliases: sample_from_constraints

### ** Examples


# Compute conditional mean of correlated lower-truncated vector
 
constr = thresh2constraints(3, lower = c(1,1,1))
covariance = matrix(c(1,0.5,0,0.5,1,0.5,0,0.5,1),nc=3)
 
samp = sample_from_constraints(linear_part = constr$linear_part,
                                    offset= constr$offset,
                                    mean_param = c(0,0,0),
                                    covariance = covariance,
                                    initial_point = c(1.5,1.5,1.5), 
                                    ndraw=500,
                                    burnin=2000)


# all points should be >= 1 
any(samp<1)
colMeans(samp)




