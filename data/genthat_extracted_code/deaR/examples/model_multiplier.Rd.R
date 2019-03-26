library(deaR)


### Name: model_multiplier
### Title: Multiplier DEA model
### Aliases: model_multiplier

### ** Examples

# Example 1.
# Replication of results in Golany and Roll (1989).
data("Golany_Roll_1989")
data_example <- read_data(datadea = Golany_Roll_1989[1:10, ],
                          dmus = 1, 
                          inputs = 2:4, 
                          outputs = 5:6) 
result <- model_multiplier(data_example, 
                           epsilon = 0, 
                           orientation = "io", 
                           rts = "crs") 
efficiencies(result)
multipliers(result)

# Example 2.
# Multiplier model with infeasible solutions (See note).
data("Fortune500")
data_Fortune <- read_data(datadea = Fortune500, 
                          dmus = 1, 
                          inputs = 2:4, 
                          outputs = 5:6) 
result2 <- model_multiplier(data_Fortune, 
                           epsilon = 1e-6, 
                           orientation = "io", 
                           rts = "crs") 
# Results for General Motors and Ford Motor are not shown by deaR 
# because the solution is infeasible.
efficiencies(result2)
multipliers(result2)




