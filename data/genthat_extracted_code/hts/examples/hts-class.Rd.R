library(hts)


### Name: hts
### Title: Create a hierarchical time series
### Aliases: hts is.hts print.hts summary.hts
### Keywords: ts

### ** Examples


# Example 1
# The hierarchical structure looks like 2 child nodes associated with level 1,
# which are followed by 3 and 2 sub-child nodes respectively at level 2.
nodes <- list(2, c(3, 2))
abc <- ts(5 + matrix(sort(rnorm(500)), ncol = 5, nrow = 100))
x <- hts(abc, nodes)

# Example 2
# Suppose we've got the bottom names that can be useful for constructing the node
# structure and the labels at higher levels. We need to specify how to split them 
# in the argument "characters".
library(hts)
abc <- ts(5 + matrix(sort(rnorm(1000)), ncol = 10, nrow = 100))
colnames(abc) <- c("A10A", "A10B", "A10C", "A20A", "A20B",
                   "B30A", "B30B", "B30C", "B40A", "B40B")
y <- hts(abc, characters = c(1, 2, 1))




