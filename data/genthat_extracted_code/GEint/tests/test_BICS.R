# test_GE_BICS.R
# Test BICS for vectors and also against the legacy code.
context("BICS")

# Expit function
expit <- function (x) 
{
  out <- exp(x)/(1 + exp(x))
  out[x > 100] = 1
  out
}

# Function to generate some data
gen_BICS_data <- function(seed, null, out_type, num_sub, num_G, num_Z, num_W) {
  set.seed(seed)
  
  G <- matrix(data=rbinom(n=num_sub*num_G, size=2, prob=0.3), nrow=num_sub, ncol=num_G)
  E <- rnorm(n=num_sub)
  Z <- matrix(data=rnorm(n=num_sub*num_Z), nrow=num_sub, ncol=num_Z)
  W <- matrix(data=rnorm(n=num_sub*num_W), nrow=num_sub, ncol=num_W)
  d_true <- cbind(1, G, E^2, G*E^2, Z, W^2)
  d_fitted <- cbind(1, G, E, G*E, Z, W)
  
  # Interaction effect?
  if (null) {
    beta_I <- rep(0, num_G)
  } else {beta_I <- runif(n=num_G, min=0.1, max=1)}
  
  # True effect sizes
  true_beta <- c(runif(n=(2+num_G), min=0.1, max=0.4), beta_I, runif(n=(num_Z+num_W), min=0.1, max=0.4))
  
  # Simulate outcome
  eta <- d_true %*% true_beta
  if (out_type == 'D') {
    mu <- expit(eta)
    Y <- rbinom(n=num_sub, size=1, prob=mu)
  } else if (out_type == 'C') {
    mu <- eta
    Y <- mu + rnorm(n=num_sub)
  }
  
  return(list(Y=Y, d_true=d_true, d_fitted=d_fitted))
}

# Make sure we get agreement from legacy code and new code.
test_that("GE_BICS_old() and GE_BICS() return the same p-value", {
  
  # Generate continuous data
  dat_list <- gen_BICS_data(seed=0, null=TRUE, out_type='C', num_sub=2000, num_G=1, num_Z=3, num_W=2)
  
  # Apply old and new code
  set.seed(0)
  old_pvalue <- GE_BICS_old(outcome=dat_list$Y, 
                     design_mat=dat_list$d_fitted, 
                     num_boots=100, 
                     desired_coef=4, 
                     outcome_type='C')
  set.seed(0)
  new_pvalue <- GE_BICS(outcome=dat_list$Y, 
                        design_mat=dat_list$d_fitted, 
                        num_boots=100, 
                        desired_coef=4, 
                        outcome_type='C')
  
  expect_equal(old_pvalue, as.numeric(new_pvalue))
  
  
  # Generate binary data
  dat_list <- gen_BICS_data(seed=0, null=TRUE, out_type='D', num_sub=2000, num_G=1, num_Z=3, num_W=2)
  
  # Apply old and new code
  set.seed(10)
  old_pvalue <- GE_BICS_old(outcome=dat_list$Y, 
                            design_mat=dat_list$d_fitted, 
                            num_boots=100, 
                            desired_coef=4, 
                            outcome_type='D')
  set.seed(10)
  new_pvalue <- GE_BICS(outcome=dat_list$Y, 
                        design_mat=dat_list$d_fitted, 
                        num_boots=100, 
                        desired_coef=4, 
                        outcome_type='D')
  
  expect_equal(old_pvalue, as.numeric(new_pvalue))
})


# Run the new code with a vector
test_that("GE_BICS() runs fine with vectors", {
  
  # Generate continuous data
  dat_list <- gen_BICS_data(seed=0, null=TRUE, out_type='C', num_sub=2000, num_G=4, num_Z=3, num_W=2)
  
  # Apply old and new code
  set.seed(0)
  new_pvalue <- GE_BICS(outcome=dat_list$Y, 
                        design_mat=dat_list$d_fitted, 
                        num_boots=100, 
                        desired_coef=(7:10), 
                        outcome_type='C')
  
  # Should be a matrix of dim 1*1 (i.e. not error message)
  expect_length(new_pvalue, 1)
  expect_is(new_pvalue, 'matrix')
  
  # Generate binary data
  dat_list <- gen_BICS_data(seed=0, null=TRUE, out_type='D', num_sub=2000, num_G=4, num_Z=3, num_W=2)
  
  # Apply old and new code
  set.seed(0)
  new_pvalue <- GE_BICS(outcome=dat_list$Y, 
                        design_mat=dat_list$d_fitted, 
                        num_boots=100, 
                        desired_coef=(7:10), 
                        outcome_type='D')
  
  # Should be a matrix of dim 1*1 (i.e. not error message)
  expect_length(new_pvalue, 1)
  expect_is(new_pvalue, 'matrix')
})
