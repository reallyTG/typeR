library(TSstudio)


### Name: ts_seasonal
### Title: Seasonality Visualization of Time Series Object
### Aliases: ts_seasonal

### ** Examples

data(USgas)
ts_seasonal(USgas)

# Seasonal box plot
ts_seasonal(USgas, type = "box") 

# Plot all the types 
ts_seasonal(USgas, type = "all")



