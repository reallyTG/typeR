library(deaR)


### Name: Libraries
### Title: Data: Cooper, Seiford and Tone (2007).
### Aliases: Libraries
### Keywords: datasets

### ** Examples

# Example 1. Non-controllable input (POPULATION).
# Replication of results in Cooper, Seiford and Tone (2007, p.221)
data(Libraries)
# POPULATION (non-controllable input) is the forth input.
data_example <- read_data(Libraries,
                          dmus=1,
                          inputs=2:5,
                          nc_inputs=4,
                          outputs=6:7)
result <- model_basic(data_example,
                      orientation="io",
                      rts="crs")
efficiencies(result)
targets(result)

# Example 2. Non-discretionary input (POPULATION).
data(Libraries)
# POPULATION (non-controllable input) is the forth input.
data_example2 <- read_data(Libraries,
                           dmus=1,
                           inputs=2:5,
                           nd_inputs=4,
                           outputs=6:7)
result2 <- model_basic(data_example2,
                       orientation="io",
                       rts="crs")
efficiencies(result2)
targets(result2)




