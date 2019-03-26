library(simcdm)


### Name: sim_dina_items
### Title: Simulation Responses from the DINA model
### Aliases: sim_dina_items

### ** Examples

N = 200
K = 5
J = 30
delta0 = rep(1, 2 ^ K)

# Creating Q matrix
Q = matrix(rep(diag(K), 2), 2 * K, K, byrow = TRUE)
for (mm in 2:K) {
  temp = combn(seq_len(K), m = mm)
  tempmat = matrix(0, ncol(temp), K)
  for (j in seq_len(ncol(temp)))
    tempmat[j, temp[, j]] = 1
  Q = rbind(Q, tempmat)
}
Q = Q[seq_len(J), ]

# Setting item parameters and generating attribute profiles
ss = gs = rep(.2, J)
PIs = rep(1 / (2 ^ K), 2 ^ K)
CLs = c((1:(2 ^ K)) %*% rmultinom(n = N, size = 1, prob = PIs))

# Defining matrix of possible attribute profiles
As = rep(0, K)
for (j in seq_len(K)) {
  temp = combn(1:K, m = j)
  tempmat = matrix(0, ncol(temp), K)
  for (j in seq_len(ncol(temp)))
    tempmat[j, temp[, j]] = 1
  As = rbind(As, tempmat)
}
As = as.matrix(As)

# Sample true attribute profiles
Alphas = As[CLs, ]

# Simulate item data under DINA model 
dina_items = sim_dina_items(Alphas, Q, ss, gs)

# Simulate attribute data under DINA model 
dina_attributes = sim_dina_attributes(Alphas, Q)



