library(simcdm)


### Name: sim_eta_matrix
### Title: Generate ideal response eta Matrix
### Aliases: sim_eta_matrix

### ** Examples

## Simulation Settings ----

# Fixed Number of Assessment Items for Q
J = 18

# Fixed Number of Attributes for Q
K = 3

## Pre-specified configuration ----

# Specify Q
qbj = c(4, 2, 1, 4, 2, 1, 4, 2, 1, 6, 5, 3, 6, 5, 3, 7, 7, 7)

# Fill Q Matrix
Q = matrix(, J, K)
for (j in seq_len(J)) {
  Q[j,] = attribute_inv_bijection(K, qbj[j])
}

# Create an eta matrix
ETA = sim_eta_matrix(K, J, Q)

## Random generation of Q matrix with ETA matrix ----

# Construct a random q matrix
Q_sim = sim_q_matrix(J, K)

# Generate the eta matrix
ETA_gen = sim_eta_matrix(K, J, Q_sim)



