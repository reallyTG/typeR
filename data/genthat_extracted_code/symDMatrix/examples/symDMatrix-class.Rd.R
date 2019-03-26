library(symDMatrix)


### Name: symDMatrix-class
### Title: A Matrix-Like Class to Represent a Symmetric Matrix Partitioned
###   into File-Backed Blocks.
### Aliases: symDMatrix-class symDMatrix

### ** Examples

# Get the path to the example symmetric matrix
path <- system.file("extdata", "G.RData", package = "symDMatrix")

# Load the example symDMatrix object (G)
load.symDMatrix(path, readonly = TRUE)

# Get the dimensions
dim(G)

# Get the row names
rownames(G)

# Get the column names
colnames(G)

# Extract the diagonal
diag(G)

# Extract rows and columns
G[1, ]
G[1:3, ]
G["per0_per0", ]
G[c("per0_per0", "per1_per1", "per2_per2"), ]



