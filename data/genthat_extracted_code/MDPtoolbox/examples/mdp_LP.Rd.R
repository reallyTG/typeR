library(MDPtoolbox)


### Name: mdp_LP
### Title: Solves discounted MDP using linear programming algorithm
### Aliases: mdp_LP

### ** Examples

# Only with a non-sparse matrix
P <- array(0, c(2,2,2))
P[,,1] <- matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE)
P[,,2] <- matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE)
R <- matrix(c(5, 10, -1, 2), 2, 2, byrow=TRUE)
mdp_LP(P, R, 0.9)



