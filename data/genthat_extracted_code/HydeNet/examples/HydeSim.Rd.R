library(HydeNet)


### Name: HydeSim
### Title: Simulated Distributions of a Decision Network
### Aliases: HydeSim HydePosterior

### ** Examples

data(PE, package="HydeNet")
Net <- HydeNetwork(~ wells + 
                     pe | wells + 
                     d.dimer | pregnant*pe + 
                     angio | pe + 
                     treat | d.dimer*angio + 
                     death | pe*treat,
                     data = PE) 
  
                 
compiledNet <- compileJagsModel(Net, n.chains=5)

#* Generate the posterior distribution
Posterior <- HydeSim(compiledNet, 
                           variable.names = c("d.dimer", "death"), 
                           n.iter = 1000)

#* Posterior Distributions for a Decision Model
Net <- setDecisionNodes(Net, angio, treat)
decisionNet <- compileDecisionModel(Net, n.chains=5)
decisionsPost <- HydeSim(decisionNet, 
                               variable.names = c("d.dimer", "death"),
                               n.iter = 1000)





