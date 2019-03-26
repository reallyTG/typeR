library(bio3d)


### Name: plot.dccm
### Title: DCCM Plot
### Aliases: plot.dccm
### Keywords: hplot

### ** Examples


## Not run: 
##D   ##-- Read example trajectory file
##D   trtfile <- system.file("examples/hivp.dcd", package="bio3d")
##D   trj <- read.dcd(trtfile)
##D 
##D   ## Read reference PDB and trim it to match the trajectory
##D   pdb <- trim(read.pdb("1W5Y"), 'calpha')
##D 
##D   ## select residues 24 to 27 and 85 to 90 in both chains
##D   inds <- atom.select(pdb, resno=c(24:27,85:90))
##D 
##D   ## lsq fit of trj on pdb
##D   xyz <- fit.xyz(pdb$xyz, trj, fixed.inds=inds$xyz, mobile.inds=inds$xyz)
##D 
##D   ## Dynamic cross-correlations of atomic displacements
##D   cij <- dccm(xyz)
##D 
##D   ## Default plot
##D   plot.dccm(cij)
##D 
##D   ## Change the color scheme and the range of colored data levels
##D   plot.dccm(cij, contour=FALSE, col.regions=bwr.colors(200), at=seq(-1,1,by=0.01) )
##D 
##D   ## Add secondary structure annotation to plot margins
##D   plot.dccm(cij, sse=pdb) 
##D 
##D   ## Add additional margin annotation for chains
##D   ## Also label x- and y-axis with PDB residue numbers
##D   ch <- ifelse(pdb$atom$chain=="A", 1,2)
##D   plot.dccm(cij, resno=pdb, sse=pdb, margin.segments=ch)
##D 
##D   ## Plot with cluster annotation from dynamic network analysis
##D   #net <- cna(cij)
##D   #plot.dccm(cij, margin.segments=net$raw.communities$membership)
##D 
##D   ## Focus on major communities (i.e. exclude those below a certain total length)
##D   #plot.dccm(cij, margin.segments=net$raw.communities$membership, segment.min=25)
##D 
## End(Not run)




