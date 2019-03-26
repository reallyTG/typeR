library(simcdm)


### Name: sim_dina_class
### Title: Simulate Binary Responses for a DINA Model
### Aliases: sim_dina_class

### ** Examples

# Set 
N       = 100
rho     = 0
K       = 3

# Fixed Number of Assessment Items for Q
J = 18

# Specify Q
qbj = c(4, 2, 1, 4, 2, 1, 4, 2, 1, 6, 5, 3, 6, 5, 3, 7, 7, 7)

# Fill Q Matrix
Q = matrix(, J, K)
for (j in seq_len(J)) {
  Q[j,] = attribute_inv_bijection(K, qbj[j])
}

# Item parm vals
ss = gs = rep(.2, J)

# Generating attribute classes depending on correlation
if (rho == 0) {
  PIs = rep(1 / (2 ^ K), 2 ^ K)
  CLs = c(seq_len(2 ^ K) %*% rmultinom(n = N, size = 1, prob = PIs)) - 1
}

if (rho > 0) {
  Z = matrix(rnorm(N * K), N, K)
  Sig = matrix(rho, K, K)
  diag(Sig) = 1
  X = Z %*% chol(Sig)
  thvals = matrix(rep(0, K), N, K, byrow = T)
  Alphas = 1 * (X > thvals)
  CLs = Alphas %*% attribute_bijection(K)
}

# Simulate data under DINA model
ETA = sim_eta_matrix(K, J, Q)
Y_sim = sim_dina_class(N, J, CLs, ETA, gs, ss)



