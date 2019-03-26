# test_valid_inference.R
context("Valid inference")

# Make sure the conditions for valid inference on \alpha_I and 
# \alpha_G are correct.

# Generate data under valid inference conditions
gen_vec_model_valid <- function(seed, null, G_valid, num_G, num_Z, num_W) {
  set.seed(seed)
  
  # Under the null hypothesis?
  if (null) {
    beta_I <- rep(0, num_G)
  } else {beta_I <- runif(n=num_G, min=0.1, max=1)}
  
  # MAF and covariance matrix for G
  prob_G = runif(n=num_G, min=0.1, max=0.3)
  if (num_G > 1) {
    temp <- num_G*(num_G-1) / 2
    corr_G <- matrix(data=0, nrow=num_G, ncol=num_G)
    corr_G[upper.tri(corr_G)] <- runif(n=temp, min=0.02, max=0.2)
    corr_G <- corr_G + t(corr_G)
    diag(corr_G) <- 1
  } else {
    corr_G <- NULL
  }
  
  # Effect sizes
  beta_0 <- runif(n=1)
  if (G_valid) {
    beta_G <- rep(0, num_G)
  } else {beta_G <- runif(n=num_G)}
  beta_E <- runif(n=1)
  ifelse(num_Z > 0, beta_Z <- runif(n=num_Z), beta_Z <- 0)
  ifelse(num_W > 0, beta_M <- runif(n=num_W), beta_M <- 0)
  beta_list <- list(beta_0, beta_G, beta_E, beta_I, beta_Z, beta_M)
  
  # Covariance matrices for Z and W
  if (num_Z > 0) {
    temp <- num_Z*(num_Z-1) / 2
    cov_Z <- matrix(data=0, nrow=num_Z, ncol=num_Z)
    cov_Z[upper.tri(cov_Z)] <- runif(n=temp, min=0.02, max=0.2)
    cov_Z <- cov_Z + t(cov_Z)
    diag(cov_Z) <- 1
  } else {
    cov_Z <- NULL
  }
  if (num_W > 0) {
    temp <- num_W*(num_W-1) / 2
    cov_W <- matrix(data=0, nrow=num_W, ncol=num_W)
    cov_W[upper.tri(cov_W)] <- runif(n=temp, min=0.02, max=0.2)
    cov_W <- cov_W + t(cov_W)
    diag(cov_W) <- 1
  } else {
    cov_W <- NULL
  }
  
  # Covariances for valid inference
  rho_GE <- rep(0, num_G)     
  if (num_Z > 0 & num_W > 0) {
    rho_ZW <- runif(n=num_Z*num_W, min=0, max=0.2)
  } else if (num_Z == 0 & num_W == 0) {
    rho_ZW <- 0
  } else {
    rho_ZW <- rep(0, max(num_Z, num_W))
  }
  if (num_Z > 0) {
    rho_GZ <- rep(0, num_G*num_Z)
    rho_EZ <- rep(0, num_Z)
    if (G_valid) {
      num_G_cor_Z <- 0
    } else {num_G_cor_Z <- floor(runif(n=1, min=0, max=num_Z+1))}
    
    G_cor_Z <- sample(1:num_Z, num_G_cor_Z, replace=F)
    for (i in 1:num_G) {
      rho_GZ[(i-1)*num_Z+G_cor_Z] <- runif(n=length(G_cor_Z), min=0, max=0.2)
    }
    
    if (num_G_cor_Z == num_Z) {
      rho_EZ <- rep(0, num_Z)
    } else if (num_G_cor_Z == 0) {
      rho_EZ <- runif(n=length(rho_EZ), min=0, max=0.2)
    } else {
      E_cor_Z <- (1:num_Z)[-G_cor_Z]
      rho_EZ[E_cor_Z] <- runif(n=(num_Z-num_G_cor_Z), min=0, max=0.2)
    }
  } else {
    rho_GZ <- rep(0, num_G)
    rho_EZ <- 0
  }
  
  if (num_W > 0) {
    rho_GW <- rep(0, num_G*num_W)
    rho_EW <- rep(0, num_W)
    if (G_valid) {
      num_G_cor_W <- 0
    } else {num_G_cor_W <- floor(runif(n=1, min=0, max=num_W+1))}
    
    G_cor_W <- sample(1:num_W, num_G_cor_W, replace=F)
    for (i in 1:num_G) {
      rho_GW[(i-1)*num_W+G_cor_W] <- runif(n=num_G_cor_W, min=0, max=0.2)
    }
    
    if (num_G_cor_W == num_W) {
      rho_EW <- rep(0, num_W)
    } else if (num_G_cor_W == 0) {
      rho_EW <- runif(n=length(rho_EW), min=0, max=0.2)
    } else {
      E_cor_W <- (1:num_W)[-G_cor_W]
      rho_EW[E_cor_W] <- runif(n=(num_W-num_G_cor_W), min=0, max=0.2)
    }
  } else {
    rho_GW <- rep(0, num_G)
    rho_EW <- 0
  }
  
  # Fill rho_list
  rho_list <- list(rho_GE, rho_GZ, rho_EZ, rho_GW, rho_EW, rho_ZW)
  
  return( list(beta_list=beta_list,
               rho_list=rho_list,
               prob_G=prob_G,
               cov_Z=cov_Z,
               cov_W=cov_W,
               corr_G=corr_G))
}



########################################################################################
# See if the conclusions we wrote about \alpha_I are true
# If G or E is independent of each other coefficient in both models
test_that("Conditions for valid inference on \\alpha_I under the null are true", {
  
  # Skip this for CRAN
  skip_on_cran()
  
  # Generate valid data
  num_G <- 4
  true_mod <- gen_vec_model_valid(seed=0, null=TRUE, G_valid=FALSE, 
                                  num_G=num_G, num_Z=4, num_W=3) 
  beta_list <- true_mod$beta_list
  rho_list <- true_mod$rho_list
  prob_G <- true_mod$prob_G
  cov_Z <- true_mod$cov_Z
  cov_W <- true_mod$cov_W
  corr_G <- true_mod$corr_G
  
  valid_normal_squaredmis <- GE_bias_normal_squaredmis(beta_list=beta_list, 
                                                rho_list=rho_list, 
                                                prob_G=prob_G, 
                                                cov_Z=cov_Z, 
                                                cov_W=cov_W, 
                                                corr_G=corr_G)
  
  valid_nleqslv <- GE_nleqslv(beta_list=valid_normal_squaredmis$beta_list,
                 cov_list=valid_normal_squaredmis$cov_list,
                 cov_mat_list=valid_normal_squaredmis$cov_mat_list,
                 mu_list=valid_normal_squaredmis$mu_list,
                 HOM_list=valid_normal_squaredmis$HOM_list)
  
  # Match with nleqslv?
  expect_equal(unname(unlist(valid_normal_squaredmis$alpha_list)),
               valid_nleqslv$x)
  
  # Valid?
  expect_equal(valid_nleqslv$x[(num_G+3):(2*num_G+2)], rep(0, num_G))
})


########################################################################################
# See if the conclusions we wrote about \alpha_G are true
# If G is independent of each other coefficient in both models
test_that("Conditions for valid inference on \\alpha_G under the null are true", {
  
  # Skip this for CRAN
  skip_on_cran()
  
  # Generate valid data
  num_G <- 4
  true_mod <- gen_vec_model_valid(seed=100, null=TRUE, G_valid=TRUE, 
                                  num_G=num_G, num_Z=4, num_W=3) 
  beta_list <- true_mod$beta_list
  rho_list <- true_mod$rho_list
  prob_G <- true_mod$prob_G
  cov_Z <- true_mod$cov_Z
  cov_W <- true_mod$cov_W
  corr_G <- true_mod$corr_G
  
  valid_normal_squaredmis <- GE_bias_normal_squaredmis(beta_list=beta_list, 
                                                           rho_list=rho_list, 
                                                           prob_G=prob_G, 
                                                           cov_Z=cov_Z, 
                                                           cov_W=cov_W, 
                                                           corr_G=corr_G)
  
  valid_nleqslv <- GE_nleqslv(beta_list=valid_normal_squaredmis$beta_list,
                                  cov_list=valid_normal_squaredmis$cov_list,
                                  cov_mat_list=valid_normal_squaredmis$cov_mat_list,
                                  mu_list=valid_normal_squaredmis$mu_list,
                                  HOM_list=valid_normal_squaredmis$HOM_list)
  
  # Match with nleqslv?
  expect_equal(unname(unlist(valid_normal_squaredmis$alpha_list)),
               valid_nleqslv$x)
  
  # Valid?
  expect_equal(valid_nleqslv$x[2:(num_G+1)], rep(0, num_G))
  expect_equal(valid_nleqslv$x[(num_G+3):(2*num_G+2)], rep(0, num_G))
})

