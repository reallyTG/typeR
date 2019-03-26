library(sdmpredictors)


### Name: list_layers_paleo
### Title: List the paleo climate layers provided by one or more datasets
### Aliases: list_layers_paleo

### ** Examples

# list the first 5 layers
list_layers_paleo()[1:5,]
# list layer codes for MARSPEC for the mid-Holocene
list_layers_paleo("MARSPEC", epoch = "mid-Holocene")$layer_code



