library(sdmpredictors)


### Name: list_layers
### Title: List the current climate layers provided by one or more datasets
### Aliases: list_layers

### ** Examples

# list the first 5 layers
list_layers()[1:5,]
# list the layercodes all monthly layers from WorldClim
worldclim <- list_layers("WorldClim")
worldclim[!is.na(worldclim$month),]$layer_code
# list layer codes for Bio-ORACLE and MARSPEC
list_layers(c("Bio-ORACLE","MARSPEC"))$layer_code
# list the first 5 terrestrial layers
list_layers(marine=FALSE)[1:5,]
# list the first 5 marine layers
list_layers(terrestrial=FALSE)[1:5,]
# list all annual MARSPEC layers (remove monthly layers)
list_layers("MARSPEC", monthly = FALSE)



