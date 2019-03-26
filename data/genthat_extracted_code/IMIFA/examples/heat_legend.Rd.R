library(IMIFA)


### Name: heat_legend
### Title: Add a colour key legend to heatmap plots
### Aliases: heat_legend
### Keywords: plotting

### ** Examples

# Generate a matrix, flip it, and plot it with a legend
data <- matrix(rnorm(50), nrow=10, ncol=5)
cols <- heat.colors(12)[12:1]
par(mar=c(5.1, 4.1, 4.1, 3.1))

image(t(data)[,nrow(data):1], col=cols)
heat_legend(data, cols); box(lwd=2)



