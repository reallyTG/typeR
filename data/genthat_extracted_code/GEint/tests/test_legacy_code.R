# test_legacy_code.R
context("Legacy code")

# Generate effect sizes and covariances for true
# model where we can do valid inference on \alpha_I
gen_true_model_valid <- function(seed, beta_I) {
  set.seed(seed)
  
  num_Z <- ceiling(runif(n=1, min=2, max=5))
  num_W <- ceiling(runif(n=1, min=2, max=5))
  half_Z <- ceiling(num_Z/2)
  half_W <- ceiling(num_W/2)
  beta_list <- list( runif(n=1, min=0.1, max=1),
                     runif(n=1, min=0.1, max=1),
                     runif(n=1, min=0.1, max=1),
                     beta_I,
                     runif(n=num_Z, min=0.1, max=1),
                     runif(n=num_W, min=0.1, max=1)	)
  rho_list <- list( 0,
                    c( rep(0, half_Z), runif(n=(num_Z-half_Z), min=0.1, max=0.3) ),
                    c( runif(n=half_Z, min=0.1, max=0.3), rep(0, num_Z-half_Z) ),
                    c( rep(0, half_W), runif(n=(num_W-half_W), min=0.1, max=0.3) ),
                    c( runif(n=half_W, min=0.1, max=0.3), rep(0, num_W-half_W) ),
                    runif(n=num_W*num_Z, min=0.02, max=0.3) )
  
  # MAF
  prob_G = runif(n=1, min=0.05, max=0.95)
  
  # Covariance matrices for Z and W
  if (num_Z > 1) {
    temp <- num_Z*(num_Z-1) / 2
    cov_Z <- runif(n=temp, min=0.02, max=0.2)
  } else {
    cov_Z <- NULL
  }
  if (num_W > 1) {
    temp <- num_W*(num_W-1) / 2
    cov_W <- runif(n=temp, min=0.02, max=0.2)
  } else {
    cov_W <- NULL
  }
  
  return( list(beta_list=beta_list,
               rho_list=rho_list,
               prob_G=prob_G,
               cov_Z=cov_Z,
               cov_W=cov_W))
  
}


# Generate effect sizes and covariances for true
# model where we CANNOT do valid inference on \alpha_I
gen_true_model_invalid <- function(seed, beta_I) {
  set.seed(seed)
  
  num_Z <- ceiling(runif(n=1, min=2, max=5))
  num_W <- ceiling(runif(n=1, min=2, max=5))
  beta_list <- list( runif(n=1, min=0.1, max=1),
                     runif(n=1, min=0.1, max=1),
                     runif(n=1, min=0.1, max=1),
                     beta_I,
                     runif(n=num_Z, min=0.1, max=1),
                     runif(n=num_W, min=0.1, max=1)	)
  rho_list <- list( runif(n=1, min=0.1, max=1),
                    runif(n=num_Z, min=0.1, max=0.3),
                    runif(n=num_Z, min=0.1, max=0.3),
                    runif(n=num_W, min=0.1, max=0.3),
                    runif(n=num_W, min=0.1, max=0.3),
                    runif(n=num_W*num_Z, min=0.02, max=0.3) )
  
  # MAF
  prob_G = runif(n=1, min=0.05, max=0.95)
  
  # Covariance matrices for Z and W
  if (num_Z > 1) {
    temp <- num_Z*(num_Z-1) / 2
    cov_Z <- runif(n=temp, min=0.02, max=0.2)
  } else {
    cov_Z <- NULL
  }
  if (num_W > 1) {
    temp <- num_W*(num_W-1) / 2
    cov_W <- runif(n=temp, min=0.02, max=0.2)
  } else {
    cov_W <- NULL
  }
  
  return( list(beta_list=beta_list,
               rho_list=rho_list,
               prob_G=prob_G,
               cov_Z=cov_Z,
               cov_W=cov_W))
}

# Test that we are calculating the moments correctly in GE_bias_normal_squaredmis().
test_that("Correct moments in GE_bias_normal_squaredmis()", {
  
  # Not for CRAN
  skip_on_cran()
  
  # Should be a positive definite covariate matrix
  true_mod <- gen_true_model_valid(seed=0, beta_I=0)
  beta_list <- true_mod$beta_list
  rho_list <- true_mod$rho_list
  prob_G <- true_mod$prob_G
  cov_Z <- true_mod$cov_Z
  cov_W <- true_mod$cov_W
  
  # The invisible() and capture.output() stop the function from printing
  set.seed(0)
  warning_flag <- tryCatch(invisible(capture.output(GE_test_moment_calcs_old(beta_list, rho_list, 
                                      prob_G,cov_Z, cov_W, num_sub=500000, test_threshold=0.01))),
                           warning=function(w) w)
  
  expect_equal(class(warning_flag)[1], "character")
  
})


# Test a result of the paper, that if we have GE independence, \beta_I=0, and each
# Z and W is independent of at least one of G or E, then \alpha_I = 0.
# Make the first half of Zs and Ws independent of G, and the second half of
# them independent of E.
# Make sure that GE_bias(), GE_scoreeqsim(), GE_nleqslv(), GE_normal_squaredmis()
# all match.
test_that("GE_bias(), GE_scoreeqsim(), GE_nleqslv(), GE_normal_squaredmis()
          all agree, and also testing for \alpha_I is valid here.", {
            
  # Not for CRAN
  skip_on_cran()         
  
  # Should be a positive definite covariate matrix
  true_mod <- gen_true_model_valid(seed=0, beta_I=0)
  beta_list <- true_mod$beta_list
  rho_list <- true_mod$rho_list
  prob_G <- true_mod$prob_G
  cov_Z <- true_mod$cov_Z
  cov_W <- true_mod$cov_W
  
  # Simulation and normal_squaredmis results
  set.seed(0)
  sim_results <- GE_scoreeq_sim_old(beta_list=beta_list, prob_G=prob_G, num_sims=500,
                                    rho_list=rho_list, cov_Z=cov_Z, cov_W=cov_W)
  solve_results <- GE_bias_normal_squaredmis_old(beta_list, rho_list, prob_G, cov_Z, cov_W)
  
  # Record higher order moments
  cov_list <- solve_results$cov_list
  HOM_list <- solve_results$HOM_list
  cov_mat_list <- solve_results$cov_mat_list
  mu_list <- solve_results$mu_list
  
  # Now try nleqslv and GE_bias
  nleqslv_results <- GE_nleqslv_old(beta_list, cov_list, cov_mat_list, mu_list, HOM_list)
  ge_bias_results <- GE_bias_old(beta_list, cov_list, cov_mat_list, mu_list, HOM_list)
  
  # Do all methods match?
  expect_equal(unlist(solve_results$alpha_list), unname(sim_results), tolerance = 0.01)
  expect_equal(unlist(solve_results$alpha_list), nleqslv_results$x)
  expect_equal(unlist(solve_results$alpha_list), unlist(ge_bias_results))
  
  # \beta_I = 0?
  expect_equal(nleqslv_results$x[4], 0, tolerance = 1*10^(-12))
})


# Test another result - which betas do \alpha_G and \alpha_I depend on?
test_that("\\alpha_G depends on \\beta_G, \\beta_E, \\beta_I, \\beta_M
          while \\alpha_I depends on \\beta_E, \\beta_I, \\beta_M.", {
  
  # Not for CRAN
  skip_on_cran()
  
  # Should be a positive definite covariate matrix
  # Due to lazy evaluation, the runif is evaluated inside the function, so the
  # seed determines it.
  true_mod <- gen_true_model_invalid(seed=100, beta_I=runif(n=1, min=0, max=1))
  beta_list <- true_mod$beta_list
  rho_list <- true_mod$rho_list
  prob_G <- true_mod$prob_G
  cov_Z <- true_mod$cov_Z
  cov_W <- true_mod$cov_W
  
  # The original alpha_I, \alpha_G
  solve_results <- GE_bias_normal_squaredmis_old(beta_list, rho_list, prob_G, cov_Z, cov_W)
  original <- unlist(solve_results$alpha_list)[c(2,4)]
  
  # Now change beta_G - only \alpha_G changes
  temp_beta_list <- beta_list
  temp_beta_list[[2]] <- temp_beta_list[[2]] * 1.5
  solve_results <- GE_bias_normal_squaredmis_old(temp_beta_list, rho_list, prob_G, cov_Z, cov_W)
  change_betaG <- unlist(solve_results$alpha_list)[c(2,4)]
  expect_false(isTRUE(all.equal(original[1], change_betaG[1])))
  expect_equal(original[2], change_betaG[2])
  
  # Now change beta_E - both \alpha_G and \alpha_I change
  temp_beta_list <- beta_list
  temp_beta_list[[3]] <- temp_beta_list[[3]] * 1.5
  solve_results <- GE_bias_normal_squaredmis_old(temp_beta_list, rho_list, prob_G, cov_Z, cov_W)
  change_betaE <- unlist(solve_results$alpha_list)[c(2,4)]
  expect_false(isTRUE(all.equal(original[1], change_betaE[1])))
  expect_false(isTRUE(all.equal(original[2], change_betaE[2])))
  
  # Now change beta_I - both \alpha_G and \alpha_I change
  temp_beta_list <- beta_list
  temp_beta_list[[4]] <- temp_beta_list[[4]] * 1.5
  solve_results <- GE_bias_normal_squaredmis_old(temp_beta_list, rho_list, prob_G, cov_Z, cov_W)
  change_betaI <- unlist(solve_results$alpha_list)[c(2,4)]
  expect_false(isTRUE(all.equal(original[1], change_betaI[1])))
  expect_false(isTRUE(all.equal(original[2], change_betaI[2])))
  
  # Now change beta_Z - Nothing changes????
  temp_beta_list <- beta_list
  temp_beta_list[[5]] <- temp_beta_list[[5]] * 1.5
  solve_results <- GE_bias_normal_squaredmis_old(temp_beta_list, rho_list, prob_G, cov_Z, cov_W)
  change_betaZ <- unlist(solve_results$alpha_list)[c(2,4)]
  expect_equal(original[1], change_betaZ[1])
  expect_equal(original[2], change_betaZ[2])
  
  # Now change beta_M - Both change
  temp_beta_list <- beta_list
  temp_beta_list[[6]] <- temp_beta_list[[6]] * 1.5
  solve_results <- GE_bias_normal_squaredmis_old(temp_beta_list, rho_list, prob_G, cov_Z, cov_W)
  change_betaM <- unlist(solve_results$alpha_list)[c(2,4)]
  expect_false(isTRUE(all.equal(original[1], change_betaM[1])))
  expect_false(isTRUE(all.equal(original[2], change_betaM[2])))
})