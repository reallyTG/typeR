library(geomorph)


### Name: plotGMPhyloMorphoSpace
### Title: Plot phylogenetic tree and specimens in tangent space
### Aliases: plotGMPhyloMorphoSpace
### Keywords: visualization

### ** Examples

data(plethspecies) 
Y.gpa<-gpagen(plethspecies$land)    #GPA-alignment    

plotGMPhyloMorphoSpace(plethspecies$phy,Y.gpa$coords)
plotGMPhyloMorphoSpace(plethspecies$phy,Y.gpa$coords, 
                 plot.param=list(t.bg="blue",txt.col="red",n.cex=1))
#NOTE: 3D plot also available: plotGMPhyloMorphoSpace(plethspecies$phy,Y.gpa$coords, zaxis= "time",
#                 plot.param=list(n.cex=2, n.bg="blue"), shadow=TRUE)



