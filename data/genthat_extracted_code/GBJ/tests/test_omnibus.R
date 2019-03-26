# test_omnibus.R

# Make sure the omnibus test is giving us the correct p-value


# Simulate for logistic regression
MC_OMNI_logistic <- function(num_sims, cor_mat, obs_omni, null_model, factor_matrix) {

  # This is \mu_0
  fitted_values <- null_model$fitted.values
  skat_dmat <- model.matrix(null_model)
  num_sub <- length(fitted_values)

  results <- rep(NA, num_sims)
  for (i in 1:num_sims) {

    # Generate a new outcome (do it this way for skat)
    sim_Y <- rbinom(n=num_sub, size=1, prob=fitted_values)
    skat_obj <- SKAT_Null_Model(sim_Y ~ skat_dmat - 1, out_type='D', Adjustment=FALSE)

    # New set of test statistics
    boot_null_mod <- glm(sim_Y ~ skat_dmat - 1, family=binomial())
    new_Z <- score_stats_only(null_model=boot_null_mod, factor_matrix=factor_matrix,
                              link_function='logit')

    GBJ_p <- GBJ(test_stats=new_Z, cor_mat=cor_mat)$GBJ_pvalue
    GHC_p <- GHC(test_stats=new_Z, cor_mat=cor_mat)$GHC_pvalue
    minP_p <- minP(test_stats=new_Z, cor_mat=cor_mat)$minP_pvalue
    skat_p <- SKAT(Z=factor_matrix, obj=skat_obj)$p.value

    results[i] <- min(GBJ_p, GHC_p, minP_p, skat_p)

    if (i%%100 == 0) {cat(i, ' done\n')}
  }

  return( length(which(results <= obs_omni))/num_sims )
}




# Simulate for linear regression
# Make sure we generate the data as Y = 0.1*X1 + 0.2*X2 + \epsilon~N(0,1)
MC_OMNI_linear <- function(num_sims, null_model, cor_mat, factor_matrix, obs_omni) {

  fitted_values <- null_model$fitted.values
  skat_dmat <- model.matrix(null_model)
  num_sub <- length(fitted_values)

  results <- rep(NA, num_sims)
  for (i in 1:num_sims) {

    sim_Y <- rnorm(n=num_sub, mean=fitted_values)

    # New set of test statistics
    skat_obj <- SKAT_Null_Model(sim_Y ~ skat_dmat - 1, out_type='C', Adjustment=FALSE)
    boot_null_mod <- glm(sim_Y ~ skat_dmat - 1)
    new_Z <- score_stats_only(null_model=boot_null_mod, factor_matrix=factor_matrix,
                              link_function='linear')

    GBJ_p <- GBJ(test_stats=new_Z, cor_mat=cor_mat)$GBJ_pvalue
    GHC_p <- GHC(test_stats=new_Z, cor_mat=cor_mat)$GHC_pvalue
    minP_p <- minP(test_stats=new_Z, cor_mat=cor_mat)$minP_pvalue
    skat_p <- SKAT(Z=factor_matrix, obj=skat_obj)$p.value

    results[i] <- min(GBJ_p, GHC_p, minP_p, skat_p)

    if (i%%100 == 0) {cat(i, ' done\n')}
  }

  return( length(which(results <= obs_omni))/num_sims )
}


# Simulate omni SS
MC_OMNI_ss <- function(num_sims, cor_mat, obs_omni) {

  # Need this for rmvnorm
  diag(cor_mat) <- 1

  for (i in 1:num_sims) {

    # Generate a new outcome (do it this way for skat)
    new_Z <- mvtnorm::rmvnorm(n=1, sigma=cor_mat)

    GBJ_p <- GBJ(test_stats=new_Z, cor_mat=cor_mat)$GBJ_pvalue
    GHC_p <- GHC(test_stats=new_Z, cor_mat=cor_mat)$GHC_pvalue
    minP_p <- minP(test_stats=new_Z, cor_mat=cor_mat)$minP_pvalue

    results[i] <- min(GBJ_p, GHC_p, minP_p)

    if (i%%100 == 0) {cat(i, ' done\n')}
  }

  return( length(which(results <= obs_omni))/num_sims )
}


##################################
# Test omni p-value for logistic
test_that("OMNI p-value correct for logistic regression case", {

  # Not for CRAN
  skip_on_cran()

  set.seed(1)

  # Generate the genotypes with exchangeable correlation matrix 5*5
  G_cor <- matrix(data=0.3, nrow=5, ncol=5)
  diag(G_cor) <- 1

  # Generate outcome
  # Don't import bindata, we only use it for this test that's not even on CRAN
  num_sub <- 1000
  G_mat <- bindata::rmvbin(n=num_sub, margprob=rep(0.3, 5), bincorr=G_cor)
  X1 <- rnorm(num_sub)
  X2 <- rnorm(num_sub)
  mu <- rje::expit(-1 + 0.1 * X1 + 0.2 * X2)
  outcome <- rbinom(n=num_sub, size=1, prob=mu)

  # Get the original test stats and correlation structure
  null_mod <- glm(outcome ~ X1 + X2, family=binomial())
  score_stats_output <- calc_score_stats(null_model=null_mod, factor_matrix=G_mat, link_function='logit')
  test_stats <- score_stats_output$test_stats
  cor_mat <- score_stats_output$cor_mat

  # Calculate p-value analytically
  omni_output <- OMNI_individual(null_model=null_mod, factor_matrix=G_mat,
                                 link_function='logit', num_boots=40)
  obs_omni <- omni_output$OMNI
  analytic_p <- omni_output$OMNI_pvalue

  # Calculate p-value with simulation
  sim_p <- MC_OMNI_logistic(num_sims=3000, cor_mat=cor_mat, obs_omni=obs_omni, null_model=null_mod,
                   factor_matrix=G_mat)

  # Analytic p-value should come close to simulation
  expect_equal(analytic_p, sim_p, tolerance = 0.02)
})



########################################################################
# Test omni p-value for linear regression case
test_that("OMNI p-value correct for linear regression case", {

  # Not for CRAN
  skip_on_cran()

  set.seed(10)

  # Generate the genotypes with exchangeable correlation matrix 5*5
  G_cor <- matrix(data=0.3, nrow=5, ncol=5)
  diag(G_cor) <- 1

  # Generate outcome
  # Don't import bindata, we only use it for this test that's not even on CRAN
  num_sub <- 550
  cprob <- bincorr2commonprob(margprob=rep(0.3, 5), bincorr=G_cor)
  sigma_struct <- commonprob2sigma(commonprob=cprob)
  G_mat <- bindata::rmvbin(n=num_sub, margprob=rep(0.3, 5), sigma=sigma_struct)
  X1 <- rnorm(num_sub)
  X2 <- rnorm(num_sub)
  mu <- 0.1 * X1 + 0.2 * X2
  outcome <- rnorm(n=num_sub, mean=mu)

  # Get the original model
  null_mod <- glm(outcome ~ X1 + X2)

  # Calculate p-value analytically
  omni_output <- OMNI_individual(null_model=null_mod, factor_matrix=G_mat,
                                 link_function='linear', num_boots=100)
  obs_omni <- omni_output$OMNI
  analytic_p <- omni_output$OMNI_pvalue

  # Calculate p-value with simulation
  sim_p <- MC_OMNI_linear(num_sims=500, null_model=null_mod, cor_mat=cor_mat, factor_matrix=G_mat,
                          obs_omni=obs_omni)

  # Analytic p-value should come close to simulation
  expect_equal(analytic_p, sim_p, tolerance = 0.02)
})



########################################################################
# Test omni p-value for summary statistics case
test_that("OMNI p-value correct for summary statistics case", {

  # Not for CRAN
  skip_on_cran()

  set.seed(0)

  cor_mat <- matrix(data=0.3, nrow=5, ncol=5)
  diag(cor_mat) <- 1

  # New test statistics
  test_stats <- as.numeric(rmvnorm(n=1, sigma=cor_mat))

  # Calculate p-value analytically
  omni_output <- OMNI_ss(test_stats=test_stats, cor_mat=cor_mat, num_boots=100)
  obs_omni <- omni_output$OMNI
  analytic_p <- omni_output$OMNI_pvalue

  # Calculate p-value with simulation
  sim_p <- MC_OMNI_ss(num_sims=500, cor_mat=cor_mat, obs_omni=obs_omni)

  # Analytic p-value should come close to simulation
  expect_equal(analytic_p, sim_p, tolerance = 0.02)
})
