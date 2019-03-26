library(NHEMOtree)


### Name: plot.NHEMOtree
### Title: Plot Method for Class NHEMOtree
### Aliases: plot.NHEMOtree
### Keywords: Plots for NHEMOtree Multi-objective optimization Evolutionary
###   algorithms Classification

### ** Examples

# Simulation of data and costs
  d         <- Sim_Data(Obs=200)
  CostMatrix<- Sim_Costs()

  res<- NHEMOtree(type="NHEMO", formula=Y2~., data=d, CostMatrix=CostMatrix, 
                  gens=5, popsize=5, crossover_prob=0.1, mutation_prob=0.1)
  plot(data=d, x=res, which="P")
  plot(data=d, x=res, which="S", col=3, type="l")
  plot(data=d, x=res, which="V", vim=5)
  plot(data=d, x=res, which="T")



