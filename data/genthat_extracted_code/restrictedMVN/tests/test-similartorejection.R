context("overall")

test_that("results are similar to rejection multivariate", {
  thresh = 0.2
  mean_vec = rep(0,3) 
  constr = thresh2constraints(3, lower = rep(thresh, 3))
  covariance = matrix(c(1,0.5,0,0.5,1,0.5,0,0.5,1),nc=3) 
  
  samp = sample_from_constraints(linear_part = constr$linear_part,
                                 offset= constr$offset,
                                 mean_param = mean_vec,
                                 covariance = covariance,
                                 initial_point = c(1,1,1), 
                                 ndraw=500000,
                                 burnin=2000) 
  
  
  # all points should be >= 0.2 
  mean_restricted = colMeans(samp)
  expect_gte(min(samp),thresh)
  
  # compare to rejection of multivariate normals
  require("MASS")
  full_samp = mvrnorm(n=500000,mu = mean_vec,Sigma = covariance)
  # Add restrictions:
  pass_restrictions = apply(full_samp, 1, 
                            function(x){all(constr$linear_part%*% x - constr$offset <=0 )}) 
    
  cond_samp = full_samp[pass_restrictions,]
  mean_restricted_rej = colMeans(cond_samp)
  
  expect_equal(sum(abs(mean_restricted - mean_restricted_rej)<=0.01),3)
  
})

test_that("results are similar to rejection univariate", {

  set.seed(3)
  as = runif(n = 4,0.5,1.5) * c(1,1,-1,-1)  
  bs = runif(n = 4,0.5,1.5) * c(1,-1,1,-1)  
  means = runif(n=4,-.5,.5)
  
  init = -sign(as)*0.01 + bs/as
  
  for (i in 1:4){
    samp = sample_from_constraints(linear_part = as[i],
                                 offset= bs[i],
                                 mean_param = means[i],
                                 covariance = 1,
                                 initial_point = init[i], 
                                 ndraw=10000,
                                 burnin=2000) 
  
    mean_restricted = mean(samp)
    # compare to rejection of univariate normal
    
    full_samp = rnorm(n=100000,mean = means[i],sd = 1)

    # Add restrictions:
    pass_restrictions = full_samp *as[i] <= bs[i]
    
    cond_samp = full_samp[pass_restrictions]
    mean_restricted_rej = mean(cond_samp)
  
    expect_equal(sum(abs(mean_restricted - mean_restricted_rej)<=0.01),1)
  }
})
