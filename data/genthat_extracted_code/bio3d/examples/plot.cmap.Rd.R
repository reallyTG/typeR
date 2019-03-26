library(bio3d)


### Name: plot.cmap
### Title: Plot Contact Matrix
### Aliases: plot.cmap
### Keywords: hplot

### ** Examples


##- Read PDB file
pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )

##- Calcualte contact map
cm <- cmap(pdb)

##- Plot contact map
plot.cmap(cm, sse=pdb)

##- Add to plot
plot.cmap(t(cm), col=3, pch=17, add=TRUE)




