library(epiGWAS)


### Name: forward_sample
### Title: Applies the forward algorithm to a single observation
### Aliases: forward_sample

### ** Examples

p <- 3 # Number of states
K <- 2 # Dimensionality of the latent space

p_init <- rep(1 / K, K)
p_trans <- array(runif((p - 1) * K * K), c(p - 1, K, K))
# Normalizing the transition probabilities
for (j in seq_len(p - 1)) {
  p_trans[j, , ] <- p_trans[j, , ] / (matrix(rowSums(p_trans[j, , ]), ncol = 1) %*% rep(1, K))
}

p_emit <- array(stats::runif(p * 3 * K), c(p, 3, K))
# Normalizing the emission probabilities
for (j in seq_len(p)) {
  p_emit[j, , ] <- p_emit[j, , ] / (matrix(rep(1, 3), ncol = 1) %*% colSums(p_emit[j, , ]))
}

X <- (runif(p, min = 0, max = 1) < 0.5) + (runif(p, min = 0, max = 1) < 0.5)

# Computing the joint log-probabilities
log_prob <- forward_sample(X, p_init, p_trans, p_emit)




