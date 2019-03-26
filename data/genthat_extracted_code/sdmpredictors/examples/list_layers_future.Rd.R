library(sdmpredictors)


### Name: list_layers_future
### Title: List the future climate layers provided by one or more datasets
### Aliases: list_layers_future

### ** Examples

# list the first 5 layers
list_layers_future()[1:5,]
# list layer codes for Bio-ORACLE with scenario B1 and year 2100
list_layers_future("Bio-ORACLE", scenario = "B1", year = 2100)$layer_code



