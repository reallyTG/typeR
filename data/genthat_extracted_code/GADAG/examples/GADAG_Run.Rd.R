library(GADAG)


### Name: GADAG_Run
### Title: Run GADAG
### Aliases: GADAG_Run

### ** Examples

 #############################################################
 # Loading toy data
 #############################################################
 data(toy_data)
 # toy_data is a list of two matrices corresponding to a "star"
 # DAG (node 1 activates all other nodes):
 # - toy_data$X is a 100x10 design matrix
 # - toy_data$G is the 10x10 adjacency matrix (ground trough)

 #############################################################
 # Running GADAG
 #############################################################
 # Simple run, with only the penalty term specified
 GADAG_results <- GADAG_Run(X=toy_data$X, lambda=0.1)
 print(GADAG_results$G.best) # optimal adjacency matrix graph

 # Expensive run with many evaluations if we refine the
 # termination conditions
 ## Not run: 
##D  n.gen <- 1e10 # we allow a very large number of iterations
##D  tol.Shannon <- 1e-10 # the entropy of Shannon of the population
##D                       # has to be very small
##D  pop.size <- 5*ncol(toy_data$G) # this is usually a good
##D                                 # population size
##D  max.eval <- n.gen * pop.size # maximal number of nested
##D                               # evaluation
##D  GADAG_results <- GADAG_Run(X=toy_data$X, lambda=0.1,
##D       GADAG.control=list(n.gen=n.gen, tol.Shannon=tol.Shannon,
##D                          pop.size = pop.size, max.eval=max.eval))
##D  print(GADAG_results$G.best) # optimal adjacency matrix graph
##D  
## End(Not run)

 # Expensive run if we also increase the population size
 ## Not run: 
##D  pop.size <- 10*ncol(toy_data$G)
##D  GADAG_results <- GADAG_Run(X=toy_data$X, lambda=0.1,
##D       GADAG.control=list(pop.size=pop.size))
##D  print(GADAG_results$G.best) # optimal adjacency matrix graph
##D  
## End(Not run)

 # You can have more information about the evolution of the
 # algorithm by turning return.level on
 ## Not run: 
##D  return.level <- 1
##D  GADAG_results <- GADAG_Run(X=toy_data$X, lambda=0.1, return.level = return.level)
##D  print(GADAG_results$f.best.evol) # this shows the evolution of the fitness
##D                                   # across the iterations
##D  
## End(Not run)



