library(DataExplorer)


### Name: plot_histogram
### Title: Plot histogram
### Aliases: plot_histogram
### Keywords: plot_histogram

### ** Examples

# Plot iris data
plot_histogram(iris)

# Plot random data with customized geom_histogram settings
set.seed(1)
data <- cbind(sapply(seq.int(4L), function(x) {rnorm(1000, sd = 30 * x)}))
plot_histogram(data, geom_histogram_args = list("breaks" = seq(-400, 400, length = 50)))



