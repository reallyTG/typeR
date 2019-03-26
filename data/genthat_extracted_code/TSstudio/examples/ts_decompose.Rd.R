library(TSstudio)


### Name: ts_decompose
### Title: Visualization of the Decompose of a Time Series Object
### Aliases: ts_decompose

### ** Examples

# Defualt decompose plot
ts_decompose(AirPassengers)

# Remove the sepration lines between the plot components
ts_decompose(AirPassengers, showline = FALSE)

# Plot side by side a decompose of additive and multiplicative series
ts_decompose(AirPassengers, type = "both")




