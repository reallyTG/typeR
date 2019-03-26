library(qualityTools)


### Name: dotPlot
### Title: Function to create a dot plot
### Aliases: dotPlot

### ** Examples

#create some data and grouping
x = rnorm(28)
g = rep(1:2, 14)

#dot plot with groups and no stacking
dotPlot(x, group = g, stacked = FALSE, pch = c(19, 20), 
        main = "Non stacked dot plot")

#dot plot with groups and stacking
x = rnorm(28)
dotPlot(x, group = g, stacked = TRUE, pch = c(19, 20), 
        main = "Stacked dot plot")





