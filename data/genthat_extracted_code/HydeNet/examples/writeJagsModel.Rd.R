library(HydeNet)


### Name: writeJagsModel
### Title: Write a Node's JAGS Model
### Aliases: writeJagsModel writeJagsModel_default writeJagsModel_dbern
###   writeJagsModel_dcat writeJagsModel_determ writeJagsModel_dnorm
###   writeJagsModel_dnorm_default writeJagsModel_dpois

### ** Examples

## Not run: 
##D #* NOTE: writeJagsModel isn't an exported function
##D data(PE, package='HydeNet')
##D Net <- HydeNetwork(~ wells + 
##D                      pe | wells + 
##D                      d.dimer | pregnant*pe + 
##D                      angio | pe + 
##D                      treat | d.dimer*angio + 
##D                      death | pe*treat,
##D                      data = PE)
##D HydeNet:::writeJagsModel(Net, 'pe')
##D HydeNet:::writeJagsModel(Net, 'treat')
## End(Not run)




