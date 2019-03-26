library(hsm)


### Name: paths
### Title: Generate 'assign' and 'w.assign'.
### Aliases: paths

### ** Examples

# The following example appears in Figure 7 of Yan & Bien (2015).
# Generate map defining DAG.
map <- matrix(0, ncol=2, nrow=8)
map[1, ] <- c(1, 2)
map[2, ] <- c(2, 7)
map[3, ] <- c(3, 4)
map[4, ] <- c(4, 6)
map[5, ] <- c(6, 7)
map[6, ] <- c(6, 8)
map[7, ] <- c(3, 5)
map[8, ] <- c(5, 6)
# Assume two parameters per node.
var <- as.list(data.frame(t(matrix(1:16, ncol=2, byrow=TRUE))))
paths.result <- paths(map, var)
paths.result$assign
paths.result$w.assign



