library(ramcmc)


### Name: adapt_S
### Title: Update the Proposal of RAM Algorithm
### Aliases: adapt_S

### ** Examples


# sample from standard normal distribution
# use proposals from the uniform distribution on
# interval (-s, s), where we adapt s

adapt_mcmc <- function(n = 10000, s) {
  x <- numeric(n)
  loglik_old <- dnorm(x[1], log = TRUE)
  for (i in 2:n) {
    u <- s * runif(1, -1, 1)
    prop <- x[i] + u
    loglik <- dnorm(prop, log = TRUE)
    accept_prob <- min(1, exp(loglik - loglik_old))
    if (runif(1) < accept_prob) {
      x[i] <- prop
      loglik_old <- loglik
    } else {
      x[i] <- x[i - 1]
    }
    # Adapt only during the burn-in
    if (i < n/2) {
      s <- adapt_S(s, u, accept_prob, i)
    }
  }
  list(x = x[(n/2):n], s = s)
}

out <- adapt_mcmc(1e5, 2)
out$s
hist(out$x)
# acceptance rate:
1 / mean(rle(out$x)$lengths)




