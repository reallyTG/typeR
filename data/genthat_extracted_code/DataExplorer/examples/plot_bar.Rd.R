library(DataExplorer)


### Name: plot_bar
### Title: Plot bar chart
### Aliases: plot_bar
### Keywords: plot_bar

### ** Examples

# Load diamonds dataset from ggplot2
library(ggplot2)
data("diamonds", package = "ggplot2")

# Plot bar charts for diamonds dataset
plot_bar(diamonds)
plot_bar(diamonds, maxcat = 5)

# Plot bar charts with `price` feature
plot_bar(diamonds, with = "price")



