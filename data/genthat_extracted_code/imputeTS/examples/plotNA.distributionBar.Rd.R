library(imputeTS)


### Name: plotNA.distributionBar
### Title: Visualize Distribution of Missing Values (Barplot)
### Aliases: plotNA.distributionBar

### ** Examples

#Example 1: Visualize the missing values in tsNH4 time series
plotNA.distributionBar(tsNH4)

#Example 2: Visualize the missing values in tsHeating time series
plotNA.distributionBar(tsHeating, breaks = 20)

#Example 3: Same as example 1, just written with pipe operator
tsNH4 %>% plotNA.distributionBar




