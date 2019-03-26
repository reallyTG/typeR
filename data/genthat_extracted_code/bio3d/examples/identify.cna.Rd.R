library(bio3d)


### Name: identify.cna
### Title: Identify Points in a CNA Protein Structure Network Plot
### Aliases: identify.cna
### Keywords: utility

### ** Examples

## Not run: 
##D 
##D if (!requireNamespace("igraph", quietly = TRUE)) {
##D    message('Need igraph installed to run this example')
##D } else {
##D 
##D attach(hivp)
##D 
##D # Read the starting PDB file to determine atom correspondence
##D pdbfile <- system.file("examples/hivp.pdb", package="bio3d")
##D pdb <- read.pdb(pdbfile)
##D 
##D # Plot the network
##D xy <- plot.cna(net)
##D 
##D # Use identify.cna on the communities
##D d <- identify.cna(xy, cna=net)
##D 
##D # Right click to end the function...
##D ## d <- identify(xy, summary(net)$members)
##D 
##D detach(hivp)
##D 
##D }
## End(Not run)



