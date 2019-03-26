## ----setup, include=FALSE------------------------------------------------
  knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------

set.seed(1)
X <- cbind(1, rnorm(100))
theta_true <- c(1, 1, 1)
y <- X %*% theta_true[1:2] + rnorm(100)


## ------------------------------------------------------------------------
metropolis <- function(y, X, theta0, S, n_iter, n_burnin, adapt = FALSE) {
  
  p <- length(theta0)
  theta <- matrix(NA, n_iter, p)
  accept <- numeric(n_iter)
  mu <- X %*% theta0[1:(p - 1)]
  posterior <- sum(dnorm(y, mean = mu, sd = theta0[p], log = TRUE))
  theta[1, ] <- theta0
  
  for (i in 2:n_iter){
    u <- rnorm(p)
    theta_prop <- theta[i - 1, ] + S %*% u
    if (theta_prop[p] > 0) {
      mu <- X %*% theta_prop[1:(p - 1)]
      posterior_prop <- sum(dnorm(y, mean = mu, sd = theta_prop[p], log = TRUE))
      acceptance_prob <- min(1, exp(posterior_prop - posterior))
      if (runif(1) < acceptance_prob) {
        accept[i] <- 1
        theta[i, ] <- theta_prop
        posterior <- posterior_prop
      }else{
        theta[i, ] <- theta[i - 1, ]
      }
    } else {
      theta[i, ] <- theta[i - 1, ]
      acceptance_prob <- 0
    }
    if(adapt & i <= n_burnin) {
      S <- ramcmc::adapt_S(S, u, acceptance_prob, i - 1)
    }
  }
  list(theta = theta[(n_burnin + 1):n_iter, ], S = S,
    acceptance_rate = sum(accept[(n_burnin + 1):n_iter]) / (n_iter - n_burnin))
}

## ------------------------------------------------------------------------
mcmc <- metropolis(y, X, c(0, 0, 1), diag(1, 3), 1e4, 1e4/2)
mcmc_adapt <- metropolis(y, X, c(0, 0, 1), diag(1, 3), 1e4, 1e4/2, adapt = TRUE)
mcmc$acceptance_rate
mcmc_adapt$acceptance_rate
mcmc_adapt$S

hist(mcmc$theta[, 2], main = "theta_2")
hist(mcmc_adapt$theta[, 2], main = "theta_2")
acf(mcmc$theta)
acf(mcmc_adapt$theta)

