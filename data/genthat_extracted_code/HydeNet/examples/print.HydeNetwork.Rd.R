library(HydeNet)


### Name: print.HydeNetwork
### Title: Print a HydeNetwork
### Aliases: print.HydeNetwork

### ** Examples

data(PE, package="HydeNet")
Net <- HydeNetwork(~ wells + 
                     pe | wells + 
                     d.dimer | pregnant*pe + 
                     angio | pe + 
                     treat | d.dimer*angio + 
                     death | pe*treat) 
print(Net)  
print(Net, d.dimer) 
                    
Net <- setNode(Net, d.dimer, 
                  nodeType='dnorm', mean=fromData(), sd=fromData(), 
                  nodeFormula = d.dimer ~ pregnant + pe,
                  nodeFitter='lm')
print(Net, d.dimer)
    



