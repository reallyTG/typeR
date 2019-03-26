library(NetworkExtinction)


### Name: ExtinctionPlot
### Title: Plots the extinctions history of a network
### Aliases: ExtinctionPlot

### ** Examples

# If you don't specify the y variable it will plot the secondary extinctions
# by default
data("net")
history <- Mostconnected(Network = net)
ExtinctionPlot(History = history)
# You can also specify the variable to be ploted in the y axis
ExtinctionPlot(History = history, Variable = "LinksPerSpecies")



