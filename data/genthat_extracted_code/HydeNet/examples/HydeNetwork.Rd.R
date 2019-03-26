library(HydeNet)


### Name: HydeNetwork
### Title: Define a Probablistic Graphical Network
### Aliases: HydeNetwork HydeNetwork.formula HydeNetwork.list

### ** Examples

#* Formula Input
Net <- HydeNetwork(~ wells + 
                     pe | wells + 
                     d.dimer | pregnant*pe + 
                     angio | pe + 
                     treat | d.dimer*angio + 
                     death | pe*treat,
                     data = PE) 
print(Net)

#* Model Input
g1 <- lm(wells ~ 1, data=PE)
g2 <- glm(pe ~ wells, data=PE, family="binomial")
g3 <- lm(d.dimer ~ pe + pregnant, data=PE)
g4 <- xtabs(~ pregnant, data=PE)
g5 <- glm(angio ~ pe, data=PE, family="binomial")
g6 <- glm(treat ~ d.dimer + angio, data=PE, family="binomial")
g7 <- glm(death ~ pe + treat, data=PE, family="binomial")

bagOfModels <- list(g1,g2,g3,g4,g5,g6,g7)

bagNet <- HydeNetwork(bagOfModels)
print(bagNet)




