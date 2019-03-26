library(NHEMOtree)


### Name: Wrapper
### Title: NSGA-II wrapper with enclosed classification tree algorithm
### Aliases: Wrapper
### Keywords: Multi-objective optimization Evolutionary algorithms
###   Nondominated Sorting Genetic Algorithm II Classification tree Wrapper
###   approach

### ** Examples

# Simulation of data and costs
  d         <- Sim_Data(Obs=200)
  CostMatrix<- Sim_Costs()

# Wrapper calculations with function NHEMOtree and type="Wrapper"
  res<- NHEMOtree(method="Wrapper", formula=Y2~., data=d, CostMatrix=CostMatrix, 
                  gens=5, popsize=5,
                  init_prob=0.8, 
                  ngens=14, bound=10^-10, 
                  crossover_prob=0.1, mutation_prob=0.1, 
                  CV=5)
  res



