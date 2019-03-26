# test_changing_betas.R
context("Changing betas")

# See what effects changing each \beta parameter has on the \alpha_I
# and \alpha_G

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


########################################################################################
# See if we got it right about which \betas affect \alpha_G and \alpha_I.
# Should be \beta_E, \beta_I, \beta_M can affect \alpha_I, and additionally \beta_G 
# can affect \alpha_G.
test_that("\\betas affecting \\alpha_G and \\alpha_I are correct", {
  
  # Not for CRAN
  skip_on_cran()
  
  # Generate valid data
  num_G <- 2
  true_mod <- gen_vec_model(seed=100, null=FALSE, num_G=num_G, num_Z=2, num_W=2) 
  beta_list <- true_mod$beta_list
  rho_list <- true_mod$rho_list
  prob_G <- true_mod$prob_G
  cov_Z <- true_mod$cov_Z
  cov_W <- true_mod$cov_W
  corr_G <- true_mod$corr_G
  
  original_normal_squaredmis <- GE_bias_normal_squaredmis(beta_list=beta_list, 
                                                          rho_list=rho_list, 
                                                          prob_G=prob_G, 
                                                          cov_Z=cov_Z, 
                                                          cov_W=cov_W, 
                                                          corr_G=corr_G)
  
  original_nleqslv <- GE_nleqslv(beta_list=original_normal_squaredmis$beta_list,
                                 cov_list=original_normal_squaredmis$cov_list,
                                 cov_mat_list=original_normal_squaredmis$cov_mat_list,
                                 mu_list=original_normal_squaredmis$mu_list,
                                 HOM_list=original_normal_squaredmis$HOM_list)
  
  # Match with nleqslv?
  expect_equal(unname(unlist(original_normal_squaredmis$alpha_list)),
               original_nleqslv$x)
  
  # Extract \alpha_G and \alpha_I
  orig_alpha_G <- original_nleqslv$x[2:(num_G+1)]
  orig_alpha_I <- original_nleqslv$x[(num_G+3):(2*num_G+2)]
  
  # Change \beta_G
  temp_beta_list <- beta_list
  temp_beta_list[[2]] <- beta_list[[2]]*1.5
  new_betaG <- GE_bias_normal_squaredmis(beta_list=temp_beta_list, 
                                         rho_list=rho_list, 
                                         prob_G=prob_G, 
                                         cov_Z=cov_Z, 
                                         cov_W=cov_W, 
                                         corr_G=corr_G)
  # Should only have changed \alpha_G
  expect_equal(unname(unlist(new_betaG$alpha_list)[-(2:(num_G+1))]),
               original_nleqslv$x[-(2:(num_G+1))])
  expect_false(isTRUE(all.equal(orig_alpha_G, as.numeric(new_betaG$alpha_list$alpha_G))))

  # Change \beta_E
  temp_beta_list <- beta_list
  temp_beta_list[[3]] <- beta_list[[3]]*1.5
  new_betaE <- GE_bias_normal_squaredmis(beta_list=temp_beta_list, 
                                       rho_list=rho_list, 
                                       prob_G=prob_G, 
                                       cov_Z=cov_Z, 
                                       cov_W=cov_W, 
                                       corr_G=corr_G)
  # Should change both \alpha_G and \alpha_I
  expect_false(isTRUE(all.equal(orig_alpha_G, as.numeric(new_betaE$alpha_list$alpha_G))))
  expect_false(isTRUE(all.equal(orig_alpha_I, as.numeric(new_betaE$alpha_list$alpha_I))))
  
  # Change \beta_I
  temp_beta_list <- beta_list
  temp_beta_list[[4]] <- beta_list[[4]]*1.5
  new_betaI <- GE_bias_normal_squaredmis(beta_list=temp_beta_list, 
                                         rho_list=rho_list, 
                                         prob_G=prob_G, 
                                         cov_Z=cov_Z, 
                                         cov_W=cov_W, 
                                         corr_G=corr_G)
  # Should change both \alpha_G and \alpha_I
  expect_false(isTRUE(all.equal(orig_alpha_G, as.numeric(new_betaI$alpha_list$alpha_G))))
  expect_false(isTRUE(all.equal(orig_alpha_I, as.numeric(new_betaI$alpha_list$alpha_I))))
  
  # Change \beta_Z
  temp_beta_list <- beta_list
  temp_beta_list[[5]] <- beta_list[[5]]*1.5
  new_betaZ <- GE_bias_normal_squaredmis(beta_list=temp_beta_list, 
                                         rho_list=rho_list, 
                                         prob_G=prob_G, 
                                         cov_Z=cov_Z, 
                                         cov_W=cov_W, 
                                         corr_G=corr_G)
  # Should change neither \alpha_G nor \alpha_I
  expect_equal(orig_alpha_G, as.numeric(new_betaZ$alpha_list$alpha_G))
  expect_equal(orig_alpha_I, as.numeric(new_betaZ$alpha_list$alpha_I))
  
  # Change \beta_M
  temp_beta_list <- beta_list
  temp_beta_list[[6]] <- beta_list[[6]]*1.5
  new_betaM <- GE_bias_normal_squaredmis(beta_list=temp_beta_list, 
                                         rho_list=rho_list, 
                                         prob_G=prob_G, 
                                         cov_Z=cov_Z, 
                                         cov_W=cov_W, 
                                         corr_G=corr_G)
  # Should change both \alpha_G and \alpha_I
  expect_false(isTRUE(all.equal(orig_alpha_G, as.numeric(new_betaM$alpha_list$alpha_G))))
  expect_false(isTRUE(all.equal(orig_alpha_I, as.numeric(new_betaM$alpha_list$alpha_I))))
})
