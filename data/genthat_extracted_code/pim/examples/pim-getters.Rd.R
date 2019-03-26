library(pim)


### Name: pim-getters
### Title: Getters for slots of a pim object
### Aliases: pim-getters keep.data getters-pim fitted fitted,pim-method

### ** Examples

data('FEVData')
themodel <- pim(FEV ~ Age + Height, data = FEVData)
keep.data(themodel)
fitted(themodel)




