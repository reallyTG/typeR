library(bio3d)


### Name: layout.cna
### Title: Protein Structure Network Layout
### Aliases: layout.cna
### Keywords: utility

### ** Examples


if (!requireNamespace("igraph", quietly = TRUE)) {
   message('Need igraph installed to run this example')
} else {

# Load the correlation network
attach(hivp)

# Read the starting PDB file to determine atom correspondence
pdbfile <- system.file("examples/hivp.pdb", package="bio3d")
pdb <- read.pdb(pdbfile)

# Plot will be slow
#xy <- plot.cna(net)
#plot3d.cna(net, pdb)

layout.cna(net, pdb, k=3)
layout.cna(net, pdb)

# can be used as input to plot.cna and plot3d.cna....
# plot.cna( net, layout=layout.cna(net, pdb) )
# plot3d.cna(net, pdb, layout=layout.cna(net, pdb, k=3))

detach(hivp)

}



