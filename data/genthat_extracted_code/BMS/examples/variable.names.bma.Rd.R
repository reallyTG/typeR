library(BMS)


### Name: variable.names.bma
### Title: Variable names and design matrix
### Aliases: variable.names.bma model.frame.bma
### Keywords: utilities

### ** Examples

 data(datafls)
 bma_enum=bms(datafls[1:20,1:10])
 
 model.frame(bma_enum) # similar to 
 bma_enum$X.data
 
 variable.names(bma_enum)[-1] # is equivalent to
 bma_enum$reg.names
 



