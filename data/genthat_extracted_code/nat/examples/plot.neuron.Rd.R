library(nat)


### Name: plot.neuron
### Title: Plot a 2D projection of a neuron
### Aliases: plot.neuron

### ** Examples

# Draw first example neuron
plot(Cell07PNs[[1]])
# Overlay second example neuron
plot(Cell07PNs[[2]], add=TRUE)
# Clear the current plot and draw the third neuron from a different view
plot(Cell07PNs[[3]], PlotAxes="YZ")
# Just plot the end points for the fourth example neuron
plot(Cell07PNs[[4]], WithNodes=FALSE)
# Plot with soma (of default radius)
plot(Cell07PNs[[4]], WithNodes=FALSE, soma=TRUE)
# Plot with soma of defined radius
plot(Cell07PNs[[4]], WithNodes=FALSE, soma=1.25)



