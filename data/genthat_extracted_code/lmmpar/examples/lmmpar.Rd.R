library(lmmpar)


### Name: lmmpar
### Title: Parallel Linear Mixed Model
### Aliases: lmmpar

### ** Examples


# Set up fake data
n <- 1000  # number of subjects
m <- 4      # number of repeats
N <- n * m  # true size of data
p <- 15     # number of betas
q <- 2      # width of random effects

# Initial parameters
# beta has a 1 for the first value.  all other values are ~N(10, 1)
beta <- rbind(1, matrix(rnorm(p, 10), p, 1))
R <- diag(m)
D <- matrix(c(16, 0, 0, 0.025), nrow = q)
sigma <- 1

# Set up data
subject <- rep(1:n, each = m)
repeats <- rep(1:m, n)

subj_x <- lapply(1:n, function(i) cbind(1, matrix(rnorm(m * p), nrow = m)))
X <- do.call(rbind, subj_x)
Z <- X[, 1:q]
subj_beta <- lapply(1:n, function(i) mnormt::rmnorm(1, rep(0, q), D))
subj_err <- lapply(1:n, function(i) mnormt::rmnorm(1, rep(0, m), sigma * R))

# create a known response
subj_y <- lapply(
  seq_len(n),
  function(i) {
    (subj_x[[i]] %*% beta) +
      (subj_x[[i]][, 1:q] %*% subj_beta[[i]]) +
      subj_err[[i]]
  }
)
Y <- do.call(rbind, subj_y)

# run the algorithm to recover the known betas
ans <- lmmpar(
  Y,
  X,
  Z,
  subject,
  beta = beta,
  R = R,
  D = D,
  cores = 1, # increase for faster computation
  sigma = sigma,
  verbose = TRUE
)
str(ans)



