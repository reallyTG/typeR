library(sdmpredictors)


### Name: get_future_layers
### Title: Get the name of future climate layer(s) based on the current
###   climate layer(s)
### Aliases: get_future_layers

### ** Examples

future_layers <- get_future_layers(c("BO_salinity", "BO_sstmean"), 
                                   scenario = "B1", year = 2100)
future_layers$layer_code



