library(DataExplorer)


### Name: plot_density
### Title: Plot density estimates
### Aliases: plot_density
### Keywords: plot_density

### ** Examples

# Plot using iris data
plot_density(iris)

# Plot using random data
set.seed(1)
data <- cbind(sapply(seq.int(4L), function(x) {
          runif(500, min = sample(100, 1), max = sample(1000, 1))
        }))
plot_density(data)

# Add color to density area
plot_density(data, geom_density_args = list("fill" = "black", "alpha" = 0.6))



