library(HydeNet)


### Name: setNode
### Title: Set Node Relationships
### Aliases: setNode fromData fromFormula

### ** Examples

data(PE, package="HydeNet")
Net <- HydeNetwork(~ wells + 
                     pe | wells + 
                     d.dimer | pregnant*pe + 
                     angio | pe + 
                     treat | d.dimer*angio + 
                     death | pe*treat,
                     data = PE) 
print(Net, d.dimer)

#* Manually change the precision
Net <- setNode(Net, d.dimer, nodeType='dnorm', mean=fromFormula(), sd=sqrt(2.65), 
                  nodeFormula = d.dimer ~ pregnant * pe,
                  nodeFitter='lm')
print(Net, d.dimer)




