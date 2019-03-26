library(symDMatrix)


### Name: nBlocks
### Title: Return the Number of Column/Row Blocks of a symDMatrix Object.
### Aliases: nBlocks

### ** Examples

# Load example symDMatrix (G)
load.symDMatrix(system.file("extdata", "G.RData", package = "symDMatrix"), readonly = TRUE)

# Get the number of row blocks the original matrix was partitioned into
nBlocks(G)



