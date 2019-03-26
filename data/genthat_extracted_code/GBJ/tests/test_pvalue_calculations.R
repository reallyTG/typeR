# test_pvalue_calculations.R

# Test that our p-value calculations are correct by verifying through simulation


# Function to simulate the p-value of GBJ
MC_GBJ <- function(num_sims, cor_mat, obs_gbj) {

  d <- nrow(cor_mat)
  pairwise_cors <- cor_mat[upper.tri(cor_mat)]

  # Simulate the p-value
  results <- rep(NA, num_sims)
  for (i in 1:num_sims) {
    # New set of test statistics
    new_Z <- as.numeric(mvtnorm::rmvnorm(n=1, sigma=cor_mat))
    new_Z <- sort(abs(new_Z), decreasing=TRUE)

    # Calculate the observed GBJ statistic
    GBJ_stats <- GBJ_objective(t_vec=new_Z, d=d, pairwise_cors=pairwise_cors)
    results[i] <- max(GBJ_stats)
  }

  return( length(which(results >= obs_gbj)) / num_sims )
}


# Function to simulate the p-value of GHC
MC_GHC <- function(num_sims, cor_mat, obs_ghc) {

  d <- nrow(cor_mat)
  pairwise_cors <- cor_mat[upper.tri(cor_mat)]

  # Simulate the p-value
  results <- rep(NA, num_sims)
  for (i in 1:num_sims) {
    # New set of test statistics
    new_Z <- as.numeric(mvtnorm::rmvnorm(n=1, sigma=cor_mat))
    t_vec <- sort(abs(new_Z), decreasing=TRUE)

    # Calculate GHC objectives
    i_vec <- 1:d
    p_values <- 1-pchisq(t_vec^2, df=1)
    GHC_stats <- (i_vec - d*p_values) / sqrt(calc_var_nonzero_mu(d=d, t=t_vec, mu=0,
                                                                 pairwise_cors=pairwise_cors))

    # Observed GHC statistic - sometimes a Z-statistic is 0 and so we get NA for variance
    results[i] <- max(GHC_stats, na.rm=TRUE)
  }

  return( length(which(results >= obs_ghc))/num_sims )
}

# Function to simulate the p-value of BJ
MC_BJ <- function(num_sims, cor_mat, obs_bj) {

  d <- nrow(cor_mat)

  # Simulate the p-value
  results <- rep(NA, num_sims)
  for (i in 1:num_sims) {
    # New set of test statistics
    new_Z <- as.numeric(mvtnorm::rmvnorm(n=1, sigma=cor_mat))
    t_vec <- sort(abs(new_Z), decreasing=TRUE)

    # Check for qualifying p-values under the null (the indicator part of the GBJ statistic)
    # and also that we are only considering 'first half' p-values
    p_values <- 1-pchisq(t_vec^2, df=1)
    BJ_indicator <- which( p_values < (1:d)/d )
    first_half <- 1:(ceiling(d/2))
    non_zero <- intersect(BJ_indicator, first_half)

    # If no indicies qualified, stop
    if (length(non_zero) == 0) {
      results[i] <- 0
      next
    }

    # Some indicies passed
    i_vec <- 1:d
    BJ_stats <- rep(0, d)
    BJ_stats[non_zero] <- i_vec[non_zero] * log(i_vec[non_zero]/(d*p_values[non_zero])) +
      (d-i_vec[non_zero]) * log((1-i_vec[non_zero]/d)/(1-p_values[non_zero]))
    BJ_stats[d] <- 0

    # Observed BJ statistic
    results[i] <- max(BJ_stats[1:(ceiling(d/2))])
  }

  return( length(which(results >= obs_bj))/num_sims )
}


# Function to simulate the p-value of HC
MC_HC <- function(num_sims, cor_mat, obs_hc) {

  d <- nrow(cor_mat)

  # Simulate the p-value
  results <- rep(NA, num_sims)
  for (i in 1:num_sims) {
    # New set of test statistics
    new_Z <- as.numeric(mvtnorm::rmvnorm(n=1, sigma=cor_mat))
    t_vec <- sort(abs(new_Z), decreasing=TRUE)

    # Calculate HC objectives
    p_values <- 1-pchisq(t_vec^2, df=1)
    i_vec <- 1:d
    HC_stats <- sqrt(d) * (i_vec/d - p_values) / sqrt(p_values*(1-p_values))

    # Observed HC statistic
    results[i] <- max(HC_stats, na.rm=TRUE)
  }

  return( length(which(results >= obs_hc))/num_sims )
}


# Function to simulate the p-value of minP
MC_minP <- function(num_sims, cor_mat, obs_minp) {

  d <- nrow(cor_mat)

  # Simulate the p-value
  results <- rep(NA, num_sims)
  for (i in 1:num_sims) {
    # New set of test statistics
    new_Z <- as.numeric(mvtnorm::rmvnorm(n=1, sigma=cor_mat))

    # Observed HC statistic
    results[i] <- min(1-pchisq(new_Z^2, df=1))
  }

  return( length(which(results <= obs_minp))/num_sims )
}





################################################
# Run the GBJ test on CRAN, others don't
test_that("GBJ p-value correct", {

  set.seed(11)

  # Generate the data with exchangeable correlation matrix 5*5
  cor_mat <- matrix(data=0.3, nrow=5, ncol=5)
  diag(cor_mat) <- 1
  test_stats <- as.numeric(mvtnorm::rmvnorm(n=1, sigma=cor_mat))

  # Calculate p-value analytically
  obs_gbj <- GBJ(test_stats=test_stats, cor_mat=cor_mat)$GBJ
  analytic_p <- GBJ(test_stats=test_stats, cor_mat=cor_mat)$GBJ_pvalue

  # Calculate p-value with simulation
  sim_p <- MC_GBJ(num_sims=5000, cor_mat=cor_mat, obs_gbj=obs_gbj)

  # Should change neither \alpha_G nor \alpha_I
  expect_equal(analytic_p, sim_p, tolerance = 0.05)
})

################################################
# Test GHC p-value
test_that("GHC p-value correct", {

  # Not for CRAN
  skip_on_cran()

  set.seed(0)

  # Generate the data with exchangeable correlation matrix 5*5
  cor_mat <- matrix(data=0.3, nrow=5, ncol=5)
  diag(cor_mat) <- 1
  test_stats <- as.numeric(mvtnorm::rmvnorm(n=1, sigma=cor_mat))

  # Calculate p-value analytically
  obs_ghc <- GHC(test_stats=test_stats, cor_mat=cor_mat)$GHC
  analytic_p <- GHC(test_stats=test_stats, cor_mat=cor_mat)$GHC_pvalue

  # Calculate p-value with simulation
  sim_p <- MC_GHC(num_sims=5000, cor_mat=cor_mat, obs_ghc=obs_ghc)

  # Should change neither \alpha_G nor \alpha_I
  expect_equal(analytic_p, sim_p, tolerance = 0.02)
})


################################################
# Test BJ p-value
test_that("BJ p-value correct", {

  # Not for CRAN
  skip_on_cran()

  set.seed(0)

  # Generate the data with exchangeable correlation matrix 5*5
  cor_mat <- matrix(data=0.3, nrow=5, ncol=5)
  diag(cor_mat) <- 1
  test_stats <- as.numeric(mvtnorm::rmvnorm(n=1, sigma=cor_mat))

  # Calculate p-value analytically
  obs_bj <- BJ(test_stats=test_stats, cor_mat=cor_mat)$BJ
  analytic_p <- BJ(test_stats=test_stats, cor_mat=cor_mat)$BJ_pvalue

  # Calculate p-value with simulation
  sim_p <- MC_BJ(num_sims=10000, cor_mat=cor_mat, obs_bj=obs_bj)

  # Should change neither \alpha_G nor \alpha_I
  expect_equal(analytic_p, sim_p, tolerance = 0.02)
})



################################################
# Test HC p-value
test_that("HC p-value correct", {

  # Not for CRAN
  skip_on_cran()

  set.seed(0)

  # Generate the data with exchangeable correlation matrix 5*5
  cor_mat <- matrix(data=0.3, nrow=5, ncol=5)
  diag(cor_mat) <- 1
  test_stats <- as.numeric(mvtnorm::rmvnorm(n=1, sigma=cor_mat))

  # Calculate p-value analytically
  obs_hc <- HC(test_stats=test_stats, cor_mat=cor_mat)$HC
  analytic_p <- HC(test_stats=test_stats, cor_mat=cor_mat)$HC_pvalue

  # Calculate p-value with simulation
  sim_p <- MC_HC(num_sims=10000, cor_mat=cor_mat, obs_hc=obs_hc)

  # Should change neither \alpha_G nor \alpha_I
  expect_equal(analytic_p, sim_p, tolerance = 0.02)
})


################################################
# Test minP p-value
test_that("minP p-value correct", {

  # Not for CRAN
  skip_on_cran()

  set.seed(0)

  # Generate the data with exchangeable correlation matrix 5*5
  cor_mat <- matrix(data=0.3, nrow=5, ncol=5)
  diag(cor_mat) <- 1
  test_stats <- as.numeric(mvtnorm::rmvnorm(n=1, sigma=cor_mat))

  # Calculate p-value analytically
  obs_minp <- min(1-pchisq(test_stats^2, df=1))
  analytic_p <- minP(test_stats=test_stats, cor_mat=cor_mat)$minP_pvalue

  # Calculate p-value with simulation
  sim_p <- MC_minP(num_sims=10000, cor_mat=cor_mat, obs_minp=obs_minp)

  # Should change neither \alpha_G nor \alpha_I
  expect_equal(analytic_p, sim_p, tolerance = 0.02)
})
