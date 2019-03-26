library(deaR)


### Name: model_nonradial
### Title: Non-radial DEA model.
### Aliases: model_nonradial

### ** Examples

# Replication of results in Wu, Tsai and Zhou (2011)
data("Hotels")
data_hotels <- read_data(Hotels, 
                         dmus = 1, 
                         inputs = 2:5, 
                         outputs = 6:8)
result <- model_nonradial(data_hotels, 
                          orientation = "oo", 
                          rts = "vrs")
efficiencies(result)




