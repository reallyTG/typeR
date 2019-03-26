library(HydeNet)


### Name: print.HydeSim
### Title: Print a Hyde Simulated Distribution Object
### Aliases: print.HydeSim

### ** Examples

data(PE, package="HydeNet")
Net <- HydeNetwork(~ wells + 
                     pe | wells + 
                     d.dimer | pregnant*pe + 
                     angio | pe + 
                     treat | d.dimer*angio + 
                     death | pe*treat,
                     data = PE) 

Net <- setDecisionNodes(Net, treat)  
                 
compiledNet <- compileJagsModel(Net, n.chains=5)

#* Generate the posterior distribution for the model (but not the 
#* decision model)
Posterior <- HydeSim(compiledNet, 
                           variable.names = c("d.dimer", "death"), 
                           n.iter = 1000)
Posterior

#* Generate the posterior for the decision model
Decision <- compileDecisionModel(Net, n.chains=5)
Posterior_decision <- HydeSim(Decision, 
                                    variable.names = c("d.dimer", "death"), 
                                    n.iter = 1000)




