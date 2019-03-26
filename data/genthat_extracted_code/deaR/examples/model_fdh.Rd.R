library(deaR)


### Name: model_fdh
### Title: Free disposal hull (FDH) model.
### Aliases: model_fdh

### ** Examples

# Example 1. FDH input-oriented.
# Replication of results in Sanei and Mamizadeh Chatghayeb (2013)
data("Supply_Chain")
data_fdh1 <- read_data(Supply_Chain, 
                       dmus = 1, 
                       inputs = 2:4, 
                       outputs = 5:6)
result <- model_fdh(data_fdh1) # by default orientation = "io"
efficiencies(result)

# Example 2. FDH output-oriented.
# Replication of results in Sanei and Mamizadeh Chatghayeb (2013)
data("Supply_Chain")
data_fdh2 <- read_data(Supply_Chain, 
                       dmus = 1, 
                       inputs = 5:6, 
                       outputs = 7:8)
result2 <- model_fdh(data_fdh2, 
                    orientation = "oo")
efficiencies(result2)
 



