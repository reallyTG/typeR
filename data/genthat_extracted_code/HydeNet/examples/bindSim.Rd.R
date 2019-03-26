library(HydeNet)


### Name: bindSim
### Title: Bind Simulated Distributions
### Aliases: bindSim bindPosterior

### ** Examples

#' data(PE, package="HydeNet")
Net <- HydeNetwork(~ wells + 
                     pe | wells + 
                     d.dimer | pregnant*pe + 
                     angio | pe + 
                     treat | d.dimer*angio + 
                     death | pe*treat,
                     data = PE) 
  
                 
compiledNet <- compileJagsModel(Net, n.chains=5)

#* Generate the simulated distribution
Simulated <- HydeSim(compiledNet, 
                     variable.names = c("d.dimer", "death"), 
                     n.iter=1000)

Bound <- bindSim(Simulated)

#* Bind a Decision Network
#* Note: angio shouldn't really be a decision node.  
#*       We use it here for illustration
Net <- setDecisionNodes(Net, angio, treat)
compiledDecision <- compileDecisionModel(Net, n.chains=5)
SimulatedDecision <- HydeSim(compiledDecision, 
                             variable.names = c("d.dimer", "death"),
                             n.iter = 1000)




