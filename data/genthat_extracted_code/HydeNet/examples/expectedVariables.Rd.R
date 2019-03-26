library(HydeNet)


### Name: expectedVariables
### Title: List Expected Parameter Names and Expected Variables Names
### Aliases: expectedVariables expectedParameters

### ** Examples

data(PE, package="HydeNet")
Net <- HydeNetwork(~ wells + 
                     pe | wells + 
                     d.dimer | pregnant*pe + 
                     angio | pe + 
                     treat | d.dimer*angio + 
                     death | pe*treat)
  
expectedVariables(Net, wells)
expectedVariables(Net, treat)
expectedVariables(Net, treat, returnVector=TRUE)

expectedParameters(Net, wells)
expectedParameters(Net, wells, returnVector=TRUE)



