library(estimatr)


### Name: horvitz_thompson
### Title: Horvitz-Thompson estimator for two-armed trials
### Aliases: horvitz_thompson

### ** Examples


# Set seed
set.seed(42)

# Simulate data
n <- 10
dat <- data.frame(y = rnorm(n))

library(randomizr)

#----------
# 1. Simple random assignment
#----------
dat$p <- 0.5
dat$z <- rbinom(n, size = 1, prob = dat$p)

# If you only pass condition_prs, we assume simple random sampling
horvitz_thompson(y ~ z, data = dat, condition_prs = p)
# Assume constant effects instead
horvitz_thompson(y ~ z, data = dat, condition_prs = p, se_type = "constant")

# Also can use randomizr to pass a declaration
srs_declaration <- declare_ra(N = nrow(dat), prob = 0.5, simple = TRUE)
horvitz_thompson(y ~ z, data = dat, ra_declaration = srs_declaration)

#----------
# 2. Complete random assignment
#----------

dat$z <- sample(rep(0:1, each = n/2))
# Can use a declaration
crs_declaration <- declare_ra(N = nrow(dat), prob = 0.5, simple = FALSE)
horvitz_thompson(y ~ z, data = dat, ra_declaration = crs_declaration)
# Can precompute condition_pr_mat and pass it
# (faster for multiple runs with same condition probability matrix)
crs_pr_mat <- declaration_to_condition_pr_mat(crs_declaration)
horvitz_thompson(y ~ z, data = dat, condition_pr_mat = crs_pr_mat)

#----------
# 3. Clustered treatment, complete random assigment
#-----------
# Simulating data
dat$cl <- rep(1:4, times = c(2, 2, 3, 3))
dat$prob <- 0.5
clust_crs_decl <- declare_ra(N = nrow(dat), clusters = dat$cl, prob = 0.5)
dat$z <- conduct_ra(clust_crs_decl)
# Easiest to specify using declaration
ht_cl <- horvitz_thompson(y ~ z, data = dat, ra_declaration = clust_crs_decl)
# Also can pass the condition probability and the clusters
ht_cl_manual <- horvitz_thompson(
  y ~ z,
  data = dat,
  clusters = cl,
  condition_prs = prob,
  simple = FALSE
)
ht_cl
ht_cl_manual

# Blocked estimators specified similarly

#----------
# More complicated assignment
#----------

# arbitrary permutation matrix
possible_treats <- cbind(
  c(1, 1, 0, 1, 0, 0, 0, 1, 1, 0),
  c(0, 1, 1, 0, 1, 1, 0, 1, 0, 1),
  c(1, 0, 1, 1, 1, 1, 1, 0, 0, 0)
)
arb_pr_mat <- permutations_to_condition_pr_mat(possible_treats)
# Simulating a column to be realized treatment
dat$z <- possible_treats[, sample(ncol(possible_treats), size = 1)]
horvitz_thompson(y ~ z, data = dat, condition_pr_mat = arb_pr_mat)




