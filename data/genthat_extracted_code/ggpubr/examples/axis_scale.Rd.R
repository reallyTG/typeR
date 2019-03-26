library(ggpubr)


### Name: axis_scale
### Title: Change Axis Scale: log2, log10 and more
### Aliases: axis_scale xscale yscale

### ** Examples

# Basic scatter plots
data(cars)
p <- ggscatter(cars, x = "speed", y = "dist")
p

# Set log scale
p + yscale("log2", .format = TRUE)



