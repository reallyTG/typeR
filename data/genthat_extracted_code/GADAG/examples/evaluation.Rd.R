library(GADAG)


### Name: evaluation
### Title: Evaluate the fitness of a population
### Aliases: evaluation

### ** Examples

 #############################################################
 # Loading toy data
 #############################################################
 data(toy_data)
 # toy_data is a list of two matrices corresponding to a "star"
 # DAG (node 1 activates all other nodes):
 # - toy_data$X is a 100x10 design matrix
 # - toy_data$G is the 10x10 adjacency matrix (ground trough)

 ########################################################
 # Creating a population of permutations
 ########################################################
 # first, define the parameters
 p <- ncol(toy_data$G) # number of nodes
 pop.size <- 10 # population size

 # then create your population of permutations
 Pop <- matrix(data = 0, nrow = pop.size, ncol = p)
 for(i in 1:pop.size){
     Pop[i,] = sample(p)
 }

 ########################################################
 # Evaluating the fitness of the population
 ########################################################
 # evaluation of the whole population
 Evaluation <- evaluation(Pop=Pop,X=toy_data$X,lambda=0.1)
 print(Evaluation$f) # here is the fitness of the whole population

 # evaluation of one of the permutation
 Perm <- Pop[1,]
 Evaluation <- evaluation(Pop=Perm,toy_data$X,lambda=0.1)

 # optimal matrix T associated to Perm:
 T <- matrix(Evaluation$Tpop,p,p)



