library(GADAG)


### Name: fitness
### Title: Compute the fitness of a potential solution
### Aliases: fitness

### ** Examples

 #############################################################
 # Loading toy data
 #############################################################
 data(toy_data)
 # toy_data is a list of two matrices corresponding to a "star"
 # DAG (node 1 activates all other nodes):
 # - toy_data$X is a 100x10 design matrix
 # - toy_data$G is the 10x10 adjacency matrix (ground trough)

 ############################################################
 # Creating a candidate solution
 ############################################################
 # define parameters
 p <- ncol(toy_data$G)

 # permutation matrix
 Perm <- sample(p) # permutation in a vector form
 P <- matrix(0,p,p)
 P[p*0:(p-1) + Perm] <- 1 # Perm is tranformed into a matrix form

 # lower-triangular matrix
 T <- matrix(rnorm(p),p,p)
 T[upper.tri(T,diag=TRUE)] <- 0

 ########################################################
 # Computing the fitness of the potential solution
 ########################################################
 Fitness <- fitness(P=P, X=toy_data$X, T=T, lambda=0.1)
 print(Fitness) # here is the fitness of the candidate solution (P,T)



