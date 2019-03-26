library(deaR)


### Name: Ruggiero2007
### Title: Data: Ruggiero (2007).
### Aliases: Ruggiero2007
### Keywords: datasets

### ** Examples

# Example. Replication of results in Ruggiero (2007).
data("Ruggiero2007")
# the second input is a non-discretionary input
datadea <- read_data(Ruggiero2007,
                     ni=2,
                     no=1,
                     nd_inputs=2)
result <- model_basic(datadea,
                      orientation="io",
                      rts="crs")
efficiencies(result)
slacks(result)




