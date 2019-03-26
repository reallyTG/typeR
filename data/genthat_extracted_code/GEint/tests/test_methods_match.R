# test_methods_match.R
context("Methods match")

# Make sure GE_bias(), GE_normal_squaredmis(), GE_nleqslv(), GE_scoreeq_sim()
# all give the same results.
# Also make sure matches legacy code.

# Generate effect sizes and covariances for true
# model where we can do valid inference on \alpha_I
gen_vec_model <- function(seed, null, num_G, num_Z, num_W) {
  set.seed(seed)
  
  # Under the null hypothesis?
  if (null) {
    beta_I <- rep(0, num_G)
  } else {beta_I <- runif(n=num_G, min=0.1, max=1)}
  
  if (num_Z == 0) {
    rho_GZ <- rep(0, num_G)
    rho_EZ <- 0
    beta_Z <- 0
  } else {
    rho_GZ <- runif(n=num_G*num_Z, min=0, max=0.2)
    rho_EZ <- runif(n=num_Z, min=0, max=0.2)
    beta_Z <- runif(n=num_Z, min=0.1, max=1)
  }
  
  if (num_W == 0) {
    rho_GW <- rep(0, num_G)
    rho_EW <- 0
    beta_W <- 0
  } else {
    rho_GW <- runif(n=num_G*num_W, min=0, max=0.2)
    rho_EW <- runif(n=num_W, min=0, max=0.2)
    beta_W <- runif(n=num_W, min=0.1, max=1)
  }
  
  if (num_W == 0 & num_Z == 0) {
    rho_ZW <- 0
  } else if (num_W > 0 & num_Z > 0) {
    rho_ZW <- runif(n=num_W*num_Z, min=0, max=0.2)
  } else {
    rho_ZW <- rep(0, max(num_W, 1)*max(num_Z, 1))
  }
  
  # Create effect size list
  beta_list <- list( runif(n=1, min=0.1, max=1),
                     runif(n=num_G, min=0.1, max=1),
                     runif(n=1, min=0.1, max=1),
                     beta_I,
                     beta_Z,
                     beta_W)
  
  # Create covariance list
  rho_list <- list(runif(n=num_G, min=0, max=0.2), rho_GZ, 
                   rho_EZ, rho_GW,
                   rho_EW, rho_ZW)
  
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
  
  return( list(beta_list=beta_list,
               rho_list=rho_list,
               prob_G=prob_G,
               cov_Z=cov_Z,
               cov_W=cov_W,
               corr_G=corr_G))
}


# Test that new code matches legacy code results.
test_that("New code matches legacy results", {
  
  # Should be a positive definite covariate matrix
  true_mod <- gen_vec_model(seed=0, null=FALSE, num_G=1, num_Z=2, num_W=2)
  beta_list <- true_mod$beta_list
  rho_list <- true_mod$rho_list
  prob_G <- true_mod$prob_G
  cov_Z <- true_mod$cov_Z
  cov_W <- true_mod$cov_W
  
  # Check normal_squaredmis first to get other moments
  new_normal_squaredmis <- GE_bias_normal_squaredmis(beta_list=beta_list, rho_list=rho_list, 
                                                         prob_G=prob_G, cov_Z=cov_Z, 
                                                         cov_W=cov_W, corr_G=NULL)
  #old_normal_squaredmis <- GE_bias_normal_squaredmis_old(beta_list=beta_list, rho_list=rho_list,
  #                                                       cov_Z=cov_Z[upper.tri(cov_Z)],
  #                                                       cov_W=cov_W[upper.tri(cov_W)],
  #                                                       prob_G=prob_G)
  #expect_equal(unname(unlist(new_normal_squaredmis$alpha_list)), 
  #             unlist(old_normal_squaredmis$alpha_list))
  
  # Check nleqslv
  #new_nleqslv <- GE_nleqslv(beta_list=new_normal_squaredmis$beta_list,
  #                                      cov_list=new_normal_squaredmis$cov_list,
  #                                      cov_mat_list=new_normal_squaredmis$cov_mat_list,
  #                                      mu_list=new_normal_squaredmis$mu_list,
  #                                      HOM_list=new_normal_squaredmis$HOM_list)
  #old_nleqslv <- GE_nleqslv_old(beta_list=old_normal_squaredmis$beta_list, 
  #                                  cov_list=old_normal_squaredmis$cov_list,
  #                                  cov_mat_list=old_normal_squaredmis$cov_mat_list,
  #                                  mu_list=old_normal_squaredmis$mu_list, 
  #                                  HOM_list=old_normal_squaredmis$HOM_list)
  #expect_equal(new_nleqslv$x, old_nleqslv$x)
  
  # Check simulation
  set.seed(0)
  new_sim <- GE_scoreeq_sim(num_sims=500, num_sub=2000, beta_list=beta_list, 
                     prob_G=prob_G, rho_list=rho_list, 
                     cov_Z=cov_Z, cov_W=cov_W,
                     corr_G=NULL)
  
  old_sim <- GE_scoreeq_sim_old(num_sims=500, num_sub=2000, beta_list=beta_list, 
                 prob_G=prob_G, rho_list=rho_list, 
                 cov_Z=cov_Z[upper.tri(cov_Z)], 
                 cov_W=cov_W[upper.tri(cov_W)])
  expect_equal(unname(new_sim), unname(old_sim), tolerance = 0.02)
})


# Test that our four ways of analyzing bias all give the same answer
test_that("GE_bias(), GE_nleqslv(), GE_norm_squaredmis(), GE_scoreeq_sim()
          all give the same answer.", {
  
  # Try with vector G, Z, W
  true_mod <- gen_vec_model(seed=10, null=FALSE, num_G=4, num_Z=3, num_W=2)
  beta_list <- true_mod$beta_list
  rho_list <- true_mod$rho_list
  prob_G <- true_mod$prob_G
  cov_Z <- true_mod$cov_Z
  cov_W <- true_mod$cov_W
  corr_G <- true_mod$corr_G
  
  # Check normal_squaredmis first to get other moments
  new_normal_squaredmis <- GE_bias_normal_squaredmis(beta_list=beta_list, rho_list=rho_list, 
                                                     prob_G=prob_G, cov_Z=cov_Z, 
                                                     cov_W=cov_W, corr_G=corr_G)
  new_nleqslv <- GE_nleqslv(beta_list=new_normal_squaredmis$beta_list,
                            cov_list=new_normal_squaredmis$cov_list,
                            cov_mat_list=new_normal_squaredmis$cov_mat_list,
                            mu_list=new_normal_squaredmis$mu_list,
                            HOM_list=new_normal_squaredmis$HOM_list)
  set.seed(10)
  new_sim <- GE_scoreeq_sim(num_sims=500, num_sub=2000, beta_list=beta_list, 
                                prob_G=prob_G, rho_list=rho_list, 
                                cov_Z=cov_Z, cov_W=cov_W,
                                corr_G=corr_G)
 
  expect_equal(unname(unlist(new_normal_squaredmis$alpha_list)), 
               new_nleqslv$x, tolerance = 10^(-7))
  expect_equal(new_nleqslv$x, unname(new_sim), tolerance = 0.01)
  
  
  ##################################################################
  # Try without Z
  true_mod <- gen_vec_model(seed=20, null=FALSE, num_G=3, num_Z=0, num_W=2)
  beta_list <- true_mod$beta_list
  rho_list <- true_mod$rho_list
  prob_G <- true_mod$prob_G
  cov_Z <- true_mod$cov_Z
  cov_W <- true_mod$cov_W
  corr_G <- true_mod$corr_G
  
  # Check normal_squaredmis first to get other moments
  new_normal_squaredmis <- GE_bias_normal_squaredmis(beta_list=beta_list, rho_list=rho_list, 
                                                     prob_G=prob_G, cov_Z=cov_Z, 
                                                     cov_W=cov_W, corr_G=corr_G)
  new_nleqslv <- GE_nleqslv(beta_list=new_normal_squaredmis$beta_list,
                            cov_list=new_normal_squaredmis$cov_list,
                            cov_mat_list=new_normal_squaredmis$cov_mat_list,
                            mu_list=new_normal_squaredmis$mu_list,
                            HOM_list=new_normal_squaredmis$HOM_list)
  set.seed(20)
  new_sim <- GE_scoreeq_sim(num_sims=500, num_sub=2000, beta_list=beta_list, 
                                prob_G=prob_G, rho_list=rho_list, 
                                cov_Z=cov_Z, cov_W=cov_W,
                                corr_G=corr_G)
  
  expect_equal(unname(unlist(new_normal_squaredmis$alpha_list)), 
               new_nleqslv$x, tolerance = 10^(-7))
  expect_equal(new_nleqslv$x, unname(new_sim), tolerance = 0.01)
  
  
  ##################################################################
  # Try without W
  true_mod <- gen_vec_model(seed=30, null=FALSE, num_G=2, num_Z=3, num_W=0)
  beta_list <- true_mod$beta_list
  rho_list <- true_mod$rho_list
  prob_G <- true_mod$prob_G
  cov_Z <- true_mod$cov_Z
  cov_W <- true_mod$cov_W
  corr_G <- true_mod$corr_G
  
  # Check normal_squaredmis first to get other moments
  new_normal_squaredmis <- GE_bias_normal_squaredmis(beta_list=beta_list, rho_list=rho_list, 
                                                     prob_G=prob_G, cov_Z=cov_Z, 
                                                     cov_W=cov_W, corr_G=corr_G)
  new_nleqslv <- GE_nleqslv(beta_list=new_normal_squaredmis$beta_list,
                            cov_list=new_normal_squaredmis$cov_list,
                            cov_mat_list=new_normal_squaredmis$cov_mat_list,
                            mu_list=new_normal_squaredmis$mu_list,
                            HOM_list=new_normal_squaredmis$HOM_list)
  set.seed(30)
  new_sim <- GE_scoreeq_sim(num_sims=500, num_sub=2000, beta_list=beta_list, 
                                prob_G=prob_G, rho_list=rho_list, 
                                cov_Z=cov_Z, cov_W=cov_W,
                                corr_G=corr_G)
  
  expect_equal(unname(unlist(new_normal_squaredmis$alpha_list)), 
               new_nleqslv$x, tolerance = 10^(-7))
  expect_equal(new_nleqslv$x, unname(new_sim), tolerance = 0.01)
  
  ##################################################################
  # Try without Z or W
  true_mod <- gen_vec_model(seed=40, null=FALSE, num_G=3, num_Z=0, num_W=0)
  beta_list <- true_mod$beta_list
  rho_list <- true_mod$rho_list
  prob_G <- true_mod$prob_G
  cov_Z <- true_mod$cov_Z
  cov_W <- true_mod$cov_W
  corr_G <- true_mod$corr_G
  
  # Check normal_squaredmis first to get other moments
  new_normal_squaredmis <- GE_bias_normal_squaredmis(beta_list=beta_list, rho_list=rho_list, 
                                                     prob_G=prob_G, cov_Z=cov_Z, 
                                                     cov_W=cov_W, corr_G=corr_G)
  new_nleqslv <- GE_nleqslv(beta_list=new_normal_squaredmis$beta_list,
                            cov_list=new_normal_squaredmis$cov_list,
                            cov_mat_list=new_normal_squaredmis$cov_mat_list,
                            mu_list=new_normal_squaredmis$mu_list,
                            HOM_list=new_normal_squaredmis$HOM_list)
  set.seed(40)
  new_sim <- GE_scoreeq_sim(num_sims=500, num_sub=2000, beta_list=beta_list, 
                                prob_G=prob_G, rho_list=rho_list, 
                                cov_Z=cov_Z, cov_W=cov_W,
                                corr_G=corr_G)
  
  expect_equal(unname(unlist(new_normal_squaredmis$alpha_list)), 
               new_nleqslv$x, tolerance = 10^(-7))
  expect_equal(new_nleqslv$x, unname(new_sim), tolerance = 0.01)
})

