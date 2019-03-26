library(HydeNet)


### Name: update.HydeNetwork
### Title: Update Probabilistic Graphical Network
### Aliases: update.HydeNetwork

### ** Examples

data(PE, package="HydeNet")
Net <- HydeNetwork(~ wells + 
                     pe | wells + 
                     d.dimer | pregnant*pe + 
                     angio | pe + 
                     treat | d.dimer*angio + 
                     death | pe*treat)
                     
plot(Net)

Net <- update(Net, . ~ . - pregnant)
plot(Net)
 



