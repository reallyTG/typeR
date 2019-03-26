library(NHEMOtree)


### Name: NHEMOtree
### Title: Non-hierarchical evolutionary multi-objective tree learner to
###   perform cost-sensitive classification
### Aliases: NHEMOtree print.NHEMOtree
### Keywords: Non-hierarchical evolutionary multi-objective tree learner
###   Multi-objective optimization Evolutionary algorithms Classification

### ** Examples

# Simulation of data and costs
  d         <- Sim_Data(Obs=200)
  CostMatrix<- Sim_Costs()

# NHEMOtree calculations
  res<- NHEMOtree(method="NHEMO", formula=Y2~., data=d, CostMatrix=CostMatrix, 
                  gens=5, popsize=5, crossover_prob=0.1, mutation_prob=0.1)
  res



