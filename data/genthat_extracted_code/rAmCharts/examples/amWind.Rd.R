library(rAmCharts)


### Name: amWind
### Title: Plotting wind
### Aliases: amWind

### ** Examples

data("data_wind")
amWind(data_wind)

## No test: 
# Other examples available which can be time consuming depending on your configuration.

# Change color
amWind(data = data_wind, col = "#0404B4")
amWind(data = data_wind, col = c("#0404B4","#01DF01","#FFBF00"))

# Change backTransparency
amWind(data = data_wind, col = c("#0404B4","#01DF01","#FFBF00"), backTransparency = 0.1)
amWind(data = data_wind, col = c("#0404B4","#01DF01","#FFBF00"), backTransparency = 1)
amWind(data = data_wind, col = c("#0404B4","#01DF01","#FFBF00"), backTransparency = c(0.1, 0.1, 1))

## End(No test)




