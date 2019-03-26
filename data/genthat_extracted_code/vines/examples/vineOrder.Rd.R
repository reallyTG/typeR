library(vines)


### Name: vineOrder
### Title: Select an Order of the Variables
### Aliases: vineOrder

### ** Examples

data <- matrix(runif(5 * 100), ncol = 5, nrow = 500)

vineOrder("CVine", data, method = "random")
vineOrder("DVine", data, method = "greedy",
          according = "spearman")



