library(NHEMOtree)


### Name: NHEMO_Cutoff
### Title: Non-hierarchical evolutionary multi-objective optimization with
###   local cutoff optimization
### Aliases: NHEMO_Cutoff
### Keywords: Non-hierarchical evolutionary multi-objective tree learner
###   Multi-objective optimization Evolutionary algorithms Classification

### ** Examples

# Simulation of data and costs
  d         <- Sim_Data(Obs=200)
  CostMatrix<- Sim_Costs()

# NHEMO_Cutoff calculations with function NHEMOtree and type="NHEMO_Cutoff"
  res<- NHEMOtree(method="NHEMO_Cutoff", formula=Y2~., data=d, CostMatrix=CostMatrix, 
                  gens=5, popsize=5,
                  max_nodes=5, ngens=5, bound=10^-10, init_prob=0.8, 
                  ps="tournament", tournament_size=4, crossover="standard", 
                  crossover_prob=0.1, mutation_prob=0.1, 
                  CV=5, vim=1,
                  ncutoffs=5, opt="mcr")
  res



