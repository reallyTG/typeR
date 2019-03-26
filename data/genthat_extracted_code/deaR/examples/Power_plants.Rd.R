library(deaR)


### Name: Power_plants
### Title: Data: Tone (2002).
### Aliases: Power_plants
### Keywords: datasets

### ** Examples

# Example 1. Radial super-efficiency model.
# Replication of results in Tone (2002)
data("Power_plants")
data_example <- read_data(Power_plants,
                          ni = 4,
                          no = 2)
result <- model_supereff(data_example,
                         orientation="io",
                         rts="crs")
eff <- efficiencies(result)
eff

# Example 2. SBM super-efficiency model.
data("Power_plants")
data_example <- read_data(Power_plants,
                          ni = 4,
                          no = 2)
result2 <- model_sbmsupereff(data_example,
                             orientation="io",
                             rts="crs")
efficiencies(result2)
slacks(result2)$input
references(result2)




