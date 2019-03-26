library(hybridModels)


### Name: findContactChain
### Title: Finding elements in contact chains of a dynamic network.
### Aliases: findContactChain

### ** Examples

# Loading data
data(networkSample) # help("networkSample"), for more info.
 
# contact chain function
selected.nodes <- c(37501, 36811, 36812)
contact.chain <- findContactChain(Data = networkSample, from = 'originID',
                                  to = 'destinationID', Time = 'Day', selected.nodes,
                                  type = 'chain', numberOfcores = 2)



