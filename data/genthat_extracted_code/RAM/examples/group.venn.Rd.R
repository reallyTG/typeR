library(RAM)


### Name: group.venn
### Title: Plot Venn Diagram For Two To Five Sets With Item Labels
### Aliases: group.venn
### Keywords: hplot

### ** Examples

data(ITS1, meta)
# core OTUs
core <- core.OTU.rank(data=list(ITS1=ITS1), meta=meta, rank="g",
                     meta.factor="Crop", percent=1)
# taxa that core OTUs assigned to
core.Crop1 <- core$ITS1$Crop1$taxa
core.Crop2 <- core$ITS1$Crop2$taxa
# venn plot
vectors <- list(Core_Crop1=core.Crop1, Core_Crop2=core.Crop2)
group.venn(vectors=vectors, label=TRUE, cat.pos=c(330, 150),
           lab.cex=0.7)
## Not run: 
##D group.venn(vectors=vectors, label=FALSE, cat.pos=c(330, 150),
##D            lab.cex=0.7, cex=3)
## End(Not run)



