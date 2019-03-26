library(colordistance)


### Name: scatter3dclusters
### Title: Plot 3D clusters in a 2D plot
### Aliases: scatter3dclusters

### ** Examples

clusters <- data.frame(R = runif(20, min = 0, max = 1),
                       G = runif(20, min = 0, max = 1),
                       B = runif(20, min = 0, max = 1),
                       Pct = runif(20, min = 0, max = 1))
# plot in RGB space
scatter3dclusters(clusters, scaling = 15, plus = 0.05)

# overrule determined color space and plot in HSV space
scatter3dclusters(clusters, scaling = 15, plus = 0.05, color.space = "hsv")



