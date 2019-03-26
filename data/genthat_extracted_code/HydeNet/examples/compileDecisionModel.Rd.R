library(HydeNet)


### Name: compileDecisionModel
### Title: Compile JAGS Models to Evaluate the Effect of Decisions in a
###   Network
### Aliases: compileDecisionModel

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
plot(Net)

decision1 <- compileDecisionModel(Net)

#* An effectively equivalent call as the previous
decision2 <- compileDecisionModel(Net, policyMatrix(Net))

#* Using a customized policy matrix
#* Note: this is a bit of nonsense--you can't decide if a test is negative
#*       or positive, but we'll do this for illustration.
custom_policy <- policyMatrix(Net, 
                              treat="No", 
                              angio = c("Negative", "Positive"))
decision3 <- compileDecisionModel(Net, custom_policy) 




