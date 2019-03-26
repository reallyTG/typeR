library(bio3d)


### Name: plot.cna
### Title: Protein Structure Network Plots in 2D and 3D.
### Aliases: plot.cna
### Keywords: hplot

### ** Examples

## No test: 
# PDB server connection required - testing excluded

if (!requireNamespace("igraph", quietly = TRUE)) {
   message('Need igraph installed to run this example')
} else {

##-- Build a CNA object
pdb <- read.pdb("4Q21")
modes <- nma(pdb)
cij <- dccm(modes)
net <- cna(cij, cutoff.cij=0.2)

# Plot coarse grain network based on dynamically coupled communities
xy <- plot.cna(net)
#plot.dccm(cij, margin.segments=net$communities$membership)

# Chose a different PDB informed layout for plot
plot.cna(net, pdb)

# Play with plot layout and colors...
plot.cna(net, layout=igraph::layout.mds(net$community.network), col=c("blue","green") ) 

# Plot full residue network colored by communities - will be slow due to number of edges!!
plot.cna(net, pdb, full=TRUE)

# Alter plot settings
plot.cna(net, pdb, full=TRUE, vertex.size=3, weights=1, vertex.label=NA)

}
## End(No test)



