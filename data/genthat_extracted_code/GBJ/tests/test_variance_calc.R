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



##################################
# Test omni p-value for logistic
test_that("Variance calculation in paper matches software", {

  # Not for CRAN
  skip_on_cran()

  # Define Hermite polynomials
  H0 <- function(x) {1}
  H1 <- function(x) {x}
  H2 <- function(x) {x^2-1}
  H3 <- function(x) {x^3 - 3*x}
  H4 <- function(x) {x^4 - 6*x^2 + 3}
  H5 <- function(x) {x^5 - 10*x^3 + 15*x}
  H6 <- function(x) {x^6 - 15*x^4 + 45*x^2 - 15}
  H7 <- function(x) {x^7 - 21*x^5 + 105*x^3 - 105*x}
  H8 <- function(x) {x^8 - 28*x^6 + 210*x^4 - 420*x^2 + 105}
  H9 <- function(x) {x^9 - 36*x^7 + 378*x^5 - 1260 * x^3 + 945*x}

  # Generate new parameters, d, threshold, and mu
  set.seed(0)
  d <- ceiling(runif(n=1, min=5, max=50))
  threshold <- runif(n=1, min=0, max=5)
  mu <- runif(n=1, min=0, max=5)

  # Generate a new covariance matrix
  base_sigma <- matrix(data=0.2, nrow=d, ncol=d); diag(base_sigma) <- 1
  temp_dat <- mvtnorm::rmvnorm(n=ceiling(d*1.2), sigma=base_sigma)
  sigma_test <- cor(temp_dat)

  # Get the rho_bar terms
  pairwise_cors <- sigma_test[upper.tri(sigma_test)]
  rho_bar <- rep(NA, 10)
  for (rho_it in 1:10) {rho_bar[rho_it] <- sum(pairwise_cors^rho_it) * 2 / (d*(d-1))}

  # Independence portion of variance
  lambda <- 1 - (pnorm(threshold-mu) - pnorm(-threshold-mu))

  # Hermite polynomial infinite sum
  H_plus <- (rho_bar[1] / factorial(1)) * H0(threshold-mu)^2 + (rho_bar[2] / factorial(2)) * H1(threshold-mu)^2 +
    (rho_bar[3] / factorial(3)) * H2(threshold-mu)^2 + (rho_bar[4] / factorial(4)) * H3(threshold-mu)^2 +
    (rho_bar[5] / factorial(5)) * H4(threshold-mu)^2 + (rho_bar[6] / factorial(6)) * H5(threshold-mu)^2 +
    (rho_bar[7] / factorial(7)) * H6(threshold-mu)^2 + (rho_bar[8] / factorial(8)) * H7(threshold-mu)^2 +
    (rho_bar[9] / factorial(9)) * H8(threshold-mu)^2 + (rho_bar[10] / factorial(10)) * H9(threshold-mu)^2

  H_minus <- (rho_bar[1] / factorial(1)) * H0(-threshold-mu) + (rho_bar[2] / factorial(2)) * H1(-threshold-mu)^2 +
    (rho_bar[3] / factorial(3)) * H2(-threshold-mu)^2 + (rho_bar[4] / factorial(4)) * H3(-threshold-mu)^2 +
    (rho_bar[5] / factorial(5)) * H4(-threshold-mu)^2 + (rho_bar[6] / factorial(6)) * H5(-threshold-mu)^2 +
    (rho_bar[7] / factorial(7)) * H6(-threshold-mu)^2 + (rho_bar[8] / factorial(8)) * H7(-threshold-mu)^2 +
    (rho_bar[9] / factorial(9)) * H8(-threshold-mu)^2 + (rho_bar[10] / factorial(10)) * H9(-threshold-mu)^2

  H_both <- (rho_bar[1] / factorial(1)) * H0(t-mu)*H0(-threshold-mu) + (rho_bar[2] / factorial(2)) * H1(threshold-mu)*H1(-threshold-mu) +
    (rho_bar[3] / factorial(3)) * H2(threshold-mu)*H2(-threshold-mu) + (rho_bar[4] / factorial(4)) * H3(threshold-mu)*H3(-threshold-mu) +
    (rho_bar[5] / factorial(5)) * H4(threshold-mu)*H4(-threshold-mu) + (rho_bar[6] / factorial(6)) * H5(threshold-mu)*H5(-threshold-mu) +
    (rho_bar[7] / factorial(7)) * H6(threshold-mu)*H6(-threshold-mu) + (rho_bar[8] / factorial(8)) * H7(threshold-mu)*H7(-threshold-mu) +
    (rho_bar[9] / factorial(9)) * H8(threshold-mu)*H8(-threshold-mu) + (rho_bar[10] / factorial(10)) * H9(threshold-mu)*H9(-threshold-mu)

  # Our calculation according to theorem 1 in the paper
  var_a <- d*lambda*(1-lambda) + d*(d-1)*(dnorm(threshold-mu)^2*H_plus +
                                          dnorm(-threshold-mu)^2*H_minus -
                                          2*dnorm(threshold-mu)*dnorm(-threshold-mu)*H_both)

  # Previous software calculation
  prev_software_var <- calc_var_nonzero_mu(d=d, t=threshold, mu=mu, pairwise_cors=pairwise_cors)

  # Two analytic p-value should come close to each other
  expect_equal(var_a, prev_software_var)

  # Simulate the variance too
  # Apply this function to calculate S
  calc_S <- function(x, threshold) {length(which(abs(x) >= threshold))}
  sim_samples <- 100000
  sim_data <- mvtnorm::rmvnorm(n=sim_samples, mean=rep(mu, nrow(sigma_test)), sigma=sigma_test)
  S_vec <- apply(sim_data, 1, calc_S, threshold=threshold)
  sim_var <- var(S_vec)

  # Analytic p-value should come close to simulation
  expect_equal(var_a, sim_var, tol=0.1)

})
