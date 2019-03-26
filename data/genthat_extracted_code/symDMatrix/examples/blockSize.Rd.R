library(symDMatrix)


### Name: blockSize
### Title: Return the Block Size of a symDMatrix Object.
### Aliases: blockSize

### ** Examples

# Load example symDMatrix (G)
load.symDMatrix(system.file("extdata", "G.RData", package = "symDMatrix"), readonly = TRUE)

# Get the block size
blockSize(G)

# Get the block size of the trailing blocks
blockSize(G, last = TRUE)



