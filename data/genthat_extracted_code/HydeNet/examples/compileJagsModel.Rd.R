library(HydeNet)


### Name: compileJagsModel
### Title: Compile Jags Model from a Hyde Network
### Aliases: compileJagsModel

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
Posterior

#* For a single model (ie, not a decision model), the user may choose to 
#* use the \code{rjags} function \code{coda.samples}.
#* However, this does not have a succinct print method
library(rjags)
s <- coda.samples(compiledNet$jags, 
                  variable.names = c("d.dimer", "death"), 
                  n.iter=1000)
                



