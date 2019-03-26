library(HydeNet)


### Name: writeNetworkModel
### Title: Generate JAGS Code for a Network's Model
### Aliases: writeNetworkModel

### ** Examples

data(PE, package='HydeNet')
Net <- HydeNetwork(~ wells + 
                     pe | wells + 
                     d.dimer | pregnant*pe + 
                     angio | pe + 
                     treat | d.dimer*angio + 
                     death | pe*treat,
                     data = PE)

#* Default printing
writeNetworkModel(Net)

#* Something a little easier on the eyes.
writeNetworkModel(Net, pretty=TRUE)




