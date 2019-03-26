library(bridgesampling)


### Name: ier
### Title: Standardized International Exchange Rate Changes from 1975 to
###   1986
### Aliases: ier
### Keywords: dataset

### ** Examples


## Not run: 
##D 
##D ################################################################################
##D # BAYESIAN FACTOR ANALYSIS (AS PROPOSED BY LOPES & WEST, 2004)
##D ################################################################################
##D 
##D library(bridgesampling)
##D library(rstan)
##D 
##D cores <- 4
##D options(mc.cores = cores)
##D 
##D data("ier")
##D 
##D #-------------------------------------------------------------------------------
##D # plot data
##D #-------------------------------------------------------------------------------
##D 
##D currency <- colnames(ier)
##D label <- c("US Dollar", "Canadian Dollar", "Yen", "Franc", "Lira", "Mark")
##D op <- par(mfrow = c(3, 2), mar = c(6, 6, 3, 3))
##D 
##D for (i in seq_along(currency)) {
##D   plot(ier[,currency[i]], type = "l", col = "darkblue",  axes = FALSE,
##D        ylim = c(-4, 4), ylab = "", xlab = "", lwd = 2)
##D   axis(1, at = 0:12*12, labels = 1975:1987, cex.axis = 1.7)
##D   axis(2, at = pretty(c(-4, 4)), las = 1, cex.axis = 1.7)
##D   mtext("Year", 1, cex = 1.5, line = 3.2)
##D   mtext("Exchange Rate Changes", 2, cex = 1.4, line = 3.2)
##D   mtext(label[i], 3, cex = 1.6, line = .1)
##D }
##D 
##D par(op)
##D 
##D #-------------------------------------------------------------------------------
##D # stan model
##D #-------------------------------------------------------------------------------
##D 
##D model_code <-
##D "data {
##D   int<lower=1> T; // number of observations
##D   int<lower=1> m; // number of variables
##D   int<lower=1> k; // number of factors
##D   matrix[T,m] Y;  // data matrix
##D }
##D transformed data {
##D   int<lower = 1> r;
##D   vector[m] zeros;
##D   r = m * k - k * (k - 1) / 2; // number of non-zero factor loadings
##D   zeros = rep_vector(0.0, m);
##D }
##D parameters {
##D   real beta_lower[r - k];  // lower-diagonal elements of beta
##D   real<lower = 0> beta_diag [k]; // diagonal elements of beta
##D   vector<lower = 0>[m] sigma2; // residual variances
##D }
##D transformed parameters {
##D   matrix[m,k] beta;
##D   cov_matrix[m] Omega;
##D   // construct lower-triangular factor loadings matrix
##D   {
##D     int index_lower = 1;
##D     for (j in 1:k) {
##D       for (i in 1:m) {
##D         if (i == j) {
##D           beta[j,j] = beta_diag[j];
##D         } else if (i >= j) {
##D           beta[i,j] = beta_lower[index_lower];
##D           index_lower = index_lower + 1;
##D         } else {
##D           beta[i,j] = 0.0;
##D         }
##D       }
##D     }
##D   }
##D   Omega = beta * beta' + diag_matrix(sigma2);
##D }
##D model {
##D   // priors
##D   target += normal_lpdf(beta_diag | 0, 1) - k * normal_lccdf(0 | 0, 1);
##D   target += normal_lpdf(beta_lower | 0, 1);
##D   target += inv_gamma_lpdf(sigma2 | 2.2 / 2.0, 0.1 / 2.0);
##D 
##D   // likelihood
##D   for(t in 1:T) {
##D     target += multi_normal_lpdf(Y[t] | zeros, Omega);
##D   }
##D }"
##D 
##D # compile model
##D model <- stan_model(model_code = model_code)
##D 
##D 
##D #-------------------------------------------------------------------------------
##D # fit models and compute log marginal likelihoods
##D #-------------------------------------------------------------------------------
##D 
##D # function for generating starting values
##D init_fun <- function(nchains, k, m) {
##D   r <- m * k - k * (k - 1) / 2
##D   out <- vector("list", nchains)
##D   for (i in seq_len(nchains)) {
##D     beta_lower <- array(runif(r - k, 0.05, 1), dim = r - k)
##D     beta_diag <- array(runif(k, .05, 1), dim = k)
##D     sigma2 <- array(runif(m, .05, 1.5), dim = m)
##D     out[[i]] <- list(beta_lower = beta_lower,
##D                      beta_diag = beta_diag,
##D                      sigma2 = sigma2)
##D   }
##D   return(out)
##D }
##D 
##D set.seed(1)
##D stanfit <- bridge <- vector("list", 3)
##D for (k in 1:3) {
##D   stanfit[[k]] <- sampling(model,
##D                            data = list(Y = ier, T = nrow(ier),
##D                                        m = ncol(ier), k = k),
##D                            iter = 11000, warmup = 1000, chains = 4,
##D                            init = init_fun(nchains = 4, k = k, m = ncol(ier)),
##D                            cores = cores, seed = 1)
##D   bridge[[k]] <- bridge_sampler(stanfit[[k]], method = "warp3",
##D                                 repetitions = 10, cores = cores)
##D }
##D 
##D # example output
##D summary(bridge[[2]])
##D 
##D #-------------------------------------------------------------------------------
##D # compute posterior model probabilities
##D #-------------------------------------------------------------------------------
##D 
##D pp <- post_prob(bridge[[1]], bridge[[2]], bridge[[3]],
##D           model_names = c("k = 1", "k = 2", "k = 3"))
##D pp
##D 
##D op <- par(mar = c(6, 6, 3, 3))
##D boxplot(pp, axes = FALSE,
##D      ylim = c(0, 1), ylab = "",
##D      xlab = "")
##D axis(1, at = 1:3, labels = colnames(pp), cex.axis = 1.7)
##D axis(2, cex.axis = 1.1)
##D mtext("Posterior Model Probability", 2, cex = 1.5, line = 3.2)
##D mtext("Number of Factors", 1, cex = 1.4, line = 3.2)
##D par(op)
##D 
## End(Not run)



