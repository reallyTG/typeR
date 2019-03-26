library(deaR)


### Name: model_supereff
### Title: Radial superefficiency basic DEA model
### Aliases: model_supereff

### ** Examples

# Example 1.
# Replication of results in Tone (2002, p.38)
data("Power_plants")
data_example <- read_data(Power_plants, 
                          ni = 4, 
                          no = 2)
result <- model_supereff(data_example, 
                         orientation = "io", 
                         rts = "crs") 
eff <- efficiencies(result)
 
# Example 2. 
# Results of Super-efficiency with vrs returns to scale show infeasibility solutions 
# for DMUs D4 and D6 (these DMUs are not shown in deaR results).
data("Power_plants")
data_example2 <- read_data(Power_plants, 
                           ni = 4, 
                           no = 2) 
result2 <- model_supereff(data_example2, 
                          orientation = "io", 
                          rts = "vrs") 
eff2 <- efficiencies(result2)




