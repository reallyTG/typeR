library(bio3d)


### Name: vmd
### Title: View CNA Protein Structure Network Community Output in VMD
### Aliases: vmd vmd.cna vmd.cnapath
### Keywords: utility

### ** Examples

## Not run: 
##D 
##D if (!requireNamespace("igraph", quietly = TRUE)) {
##D    message('Need igraph installed to run this example')
##D } else {
##D 
##D # Load the correlation network from MD data
##D attach(hivp)
##D 
##D # Read the starting PDB file to determine atom correspondence
##D pdbfile <- system.file("examples/hivp.pdb", package="bio3d")
##D pdb <- read.pdb(pdbfile)
##D 
##D # View cna 
##D vmd.cna(net, pdb, launch=FALSE)
##D ## within VMD set 'coloring method' to 'Chain' and 'Drawing method' to Tube
##D 
##D 
##D ##-- From NMA
##D pdb.gdi = read.pdb("1KJY")
##D pdb.gdi = trim.pdb(pdb.gdi, inds=atom.select(pdb.gdi, chain="A", elety="CA")) 
##D modes.gdi = nma(pdb.gdi)
##D cij.gdi = dccm(modes.gdi)
##D net.gdi = cna(cij.gdi, cutoff.cij=0.35)
##D #vmd.cna(net.gdi, pdb.gdi, alpha = 0.7, launch=TRUE)
##D 
##D detach(hivp)
##D 
##D }
## End(Not run)



