library(bmotif)


### Name: positions
### Title: Calculate node position vectors
### Aliases: positions

### ** Examples

set.seed(123)
row <- 15
col <- 15
m <- matrix(sample(0:1, row*col, replace=TRUE), row, col)
rownames(m) <- paste0("R", 1:nrow(m)) # give the matrix row names
colnames(m) <- paste0("C", 1:ncol(m)) # give the matrix column names
positions(M = m, six_node = TRUE, level = "all", normalisation = "none")



