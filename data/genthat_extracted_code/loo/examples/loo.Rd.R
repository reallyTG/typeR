library(loo)


### Name: loo
### Title: Efficient approximate leave-one-out cross-validation (LOO)
### Aliases: loo loo.array loo.matrix loo.function loo_i

### ** Examples


### Array and matrix methods (using example objects included with loo package)
# Array method
LLarr <- example_loglik_array()
rel_n_eff <- relative_eff(exp(LLarr))
loo(LLarr, r_eff = rel_n_eff, cores = 2)

# Matrix method
LLmat <- example_loglik_matrix()
rel_n_eff <- relative_eff(exp(LLmat), chain_id = rep(1:2, each = 500))
loo(LLmat, r_eff = rel_n_eff, cores = 2)


## Not run: 
##D ### Usage with stanfit objects
##D # see ?extract_log_lik
##D log_lik1 <- extract_log_lik(stanfit1, merge_chains = FALSE)
##D rel_n_eff <- relative_eff(exp(log_lik1))
##D loo(log_lik1, r_eff = rel_n_eff, cores = 2)
## End(Not run)

### Using log-likelihood function instead of array or matrix
set.seed(124)

# Simulate data and draw from posterior
N <- 50; K <- 10; S <- 100; a0 <- 3; b0 <- 2
p <- rbeta(1, a0, b0)
y <- rbinom(N, size = K, prob = p)
a <- a0 + sum(y); b <- b0 + N * K - sum(y)
fake_posterior <- as.matrix(rbeta(S, a, b))
dim(fake_posterior) # S x 1
fake_data <- data.frame(y,K)
dim(fake_data) # N x 2

llfun <- function(data_i, draws) {
  # each time called internally within loo the arguments will be equal to:
  # data_i: ith row of fake_data (fake_data[i,, drop=FALSE])
  # draws: entire fake_posterior matrix
  dbinom(data_i$y, size = data_i$K, prob = draws, log = TRUE)
}

# Use the loo_i function to check that llfun works on a single observation
# before running on all obs. For example, using the 3rd obs in the data:
loo_3 <- loo_i(i = 3, llfun = llfun, data = fake_data, draws = fake_posterior)
print(loo_3$pointwise[, "elpd_loo"])

# Use loo.function method
loo_with_fn <- loo(llfun, draws = fake_posterior, data = fake_data)

# If we look at the elpd_loo contribution from the 3rd obs it should be the
# same as what we got above with the loo_i function and i=3:
print(loo_with_fn$pointwise[3, "elpd_loo"])
print(loo_3$pointwise[, "elpd_loo"])

# Check that the loo.matrix method gives same answer as loo.function method
log_lik_matrix <- sapply(1:N, function(i) {
  llfun(data_i = fake_data[i,, drop=FALSE], draws = fake_posterior)
})
loo_with_mat <- loo(log_lik_matrix)
all.equal(loo_with_mat$estimates, loo_with_fn$estimates) # should be TRUE!


## Not run: 
##D ### For package developers: defining loo methods
##D 
##D # An example of a possible loo method for 'stanfit' objects (rstan package).
##D # A similar method is planned for a future release of rstan (or is already
##D # released, depending on when you are reading this). In order for users
##D # to be able to call loo(stanfit) instead of loo.stanfit(stanfit) the
##D # NAMESPACE needs to be handled appropriately (roxygen2 and devtools packages
##D # are good for that).
##D #
##D loo.stanfit <-
##D  function(x,
##D          pars = "log_lik",
##D          ...,
##D          save_psis = FALSE,
##D          cores = getOption("mc.cores", 1)) {
##D   stopifnot(length(pars) == 1L)
##D   LLarray <- loo::extract_log_lik(stanfit = x,
##D                                   parameter_name = pars,
##D                                   merge_chains = FALSE)
##D   r_eff <- loo::relative_eff(x = exp(LLarray), cores = cores)
##D   loo::loo.array(LLarray,
##D                  r_eff = r_eff,
##D                  cores = cores,
##D                  save_psis = save_psis)
##D }
## End(Not run)





