library(IMIFA)


### Name: gumbel_max
### Title: Simulate Cluster Labels from Unnormalised Log-Probabilities
###   using the Gumbel-Max Trick
### Aliases: gumbel_max
### Keywords: utility

### ** Examples

# Create weights for 3 components
  G         <- 3
  weights   <- seq_len(G)

# Call gumbel_max() repeatedly to obtain samples of the labels, zs
  iters     <- 10000
  zs        <- vapply(seq_len(iters), function(i)
               gumbel_max(probs=log(weights)), numeric(1L))

# Compare answer to the normalised weights
  tabulate(zs, nbins=G)/iters
  (normalised <- as.numeric(weights/sum(weights)))

# Simulate a matrix of dirichlet weights & the associated vector of N labels
  N       <- 400
  G       <- 8
  sizes   <- seq(from=85, to=15, by=-10)
  weights <- matrix(rDirichlet(N * G, alpha=1, nn=sizes), byrow=TRUE, nrow=N, ncol=G)
  (zs     <- gumbel_max(probs=log(weights)))



