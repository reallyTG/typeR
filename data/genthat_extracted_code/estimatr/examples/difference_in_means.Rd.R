library(estimatr)


### Name: difference_in_means
### Title: Design-based difference-in-means estimator
### Aliases: difference_in_means

### ** Examples


library(fabricatr)
library(randomizr)
# Get appropriate standard errors for unit-randomized designs

# ----------
# 1. Unit randomized
# ----------
dat <- fabricate(
  N = 100,
  Y = rnorm(100),
  Z_comp = complete_ra(N, prob = 0.4),
)

table(dat$Z_comp)
difference_in_means(Y ~ Z_comp, data = dat)

# ----------
# 2. Cluster randomized
# ----------
# Accurates estimates and standard errors for clustered designs
dat$clust <- sample(20, size = nrow(dat), replace = TRUE)
dat$Z_clust <- cluster_ra(dat$clust, prob = 0.6)

table(dat$Z_clust, dat$clust)
summary(difference_in_means(Y ~ Z_clust, clusters = clust, data = dat))

# ----------
# 3. Block randomized
# ----------
dat$block <- rep(1:10, each = 10)
dat$Z_block <- block_ra(dat$block, prob = 0.5)

table(dat$Z_block, dat$block)
difference_in_means(Y ~ Z_block, blocks = block, data = dat)

# ----------
# 4. Block cluster randomized
# ----------
# Learns this design if there are two clusters per block
dat$small_clust <- rep(1:50, each = 2)
dat$big_blocks <- rep(1:5, each = 10)

dat$Z_blcl <- block_and_cluster_ra(
  blocks = dat$big_blocks,
  clusters = dat$small_clust
 )

difference_in_means(
  Y ~ Z_blcl,
  blocks = big_blocks,
  clusters = small_clust,
  data = dat
 )

# ----------
# 5. Matched-pairs
# ----------
# Matched-pair estimates and standard errors are also accurate
# Specified same as blocked design, function learns that
# it is matched pair from size of blocks!
dat$pairs <- rep(1:50, each = 2)
dat$Z_pairs <- block_ra(dat$pairs, prob = 0.5)

table(dat$pairs, dat$Z_pairs)
difference_in_means(Y ~ Z_pairs, blocks = pairs, data = dat)

# ----------
# 6. Matched-pair cluster randomized
# ----------
# Learns this design if there are two clusters per block
dat$small_clust <- rep(1:50, each = 2)
dat$cluster_pairs <- rep(1:25, each = 4)
table(dat$cluster_pairs, dat$small_clust)

dat$Z_mpcl <- block_and_cluster_ra(
  blocks = dat$cluster_pairs,
  clusters = dat$small_clust
 )

difference_in_means(
  Y ~ Z_mpcl,
  blocks = cluster_pairs,
  clusters = small_clust,
  data = dat
 )

# ----------
# Other examples
# ----------

# Also works with multi-valued treatments if users specify
# comparison of interest
dat$Z_multi <- simple_ra(
  nrow(dat),
  conditions = c("Treatment 2", "Treatment 1", "Control"),
  prob_each = c(0.4, 0.4, 0.2)
)

# Only need to specify which condition is treated `condition2` and
# which is control `condition1`
difference_in_means(
  Y ~ Z_multi,
  condition1 = "Treatment 2",
  condition2 = "Control",
  data = dat
)
difference_in_means(
  Y ~ Z_multi,
  condition1 = "Treatment 1",
  condition2 = "Control",
  data = dat
)

# Specifying weights will result in estimation via lm_robust()
dat$w <- runif(nrow(dat))
difference_in_means(Y ~ Z_comp, weights = w, data = dat)
lm_robust(Y ~ Z_comp, weights = w, data = dat)




