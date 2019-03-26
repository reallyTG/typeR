library(NHEMOtree)


### Name: NHEMO
### Title: Non-hierarchical evolutionary multi-objective tree learner to
###   perform cost-sensitive classification
### Aliases: NHEMO
### Keywords: Non-hierarchical evolutionary multi-objective tree learner
###   Multi-objective optimization Evolutionary algorithms Classification

### ** Examples

# Simulation of data and costs
  d         <- Sim_Data(Obs=200)
  CostMatrix<- Sim_Costs()

# NHEMO calculations with function NHEMOtree and type="NHEMO"
  res<- NHEMOtree(method="NHEMO", formula=Y2~., data=d, CostMatrix=CostMatrix, 
                  gens=5, popsize=10,
                  max_nodes=5, ngens=5, bound=10^-10, init_prob=0.8, 
                  ps="tournament", tournament_size=4, crossover="standard", 
                  crossover_prob=0.1, mutation_prob=0.1, 
                  CV=5, vim=1)
  res



