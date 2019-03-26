library(HydeNet)


### Name: policyMatrix
### Title: Construct Policy and Decision Matrices
### Aliases: policyMatrix defaultPolicyMatrix

### ** Examples

data(PE, package="HydeNet")
Net <- HydeNetwork(~ wells + 
                     pe | wells + 
                     d.dimer | pregnant*pe + 
                     angio | pe + 
                     treat | d.dimer*angio + 
                     death | pe*treat,
                     data = PE) 
                     

                 
Net <- setDecisionNodes(Net, angio, treat)
plot(Net)

policyMatrix(Net)

policyMatrix(Net, treat="No", angio = c("No", "Yes"))




