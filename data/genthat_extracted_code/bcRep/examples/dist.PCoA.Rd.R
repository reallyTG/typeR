library(bcRep)


### Name: dist.PCoA
### Title: Principal coordinate analysis (PCoA; multidimensional scaling
###   [MDS]) of dissimilarity/distance indices
### Aliases: dist.PCoA plotDistPCoA

### ** Examples

## Not run: 
##D data(clones.ind)
##D seq.dist<-sequences.distance(sequences = clones.ind$unique_CDR3_sequences_AA, 
##D      method = "levenshtein", divLength=F)
##D distpcoa<-dist.PCoA(dist.tab = seq.dist, correction = "none")
##D 
##D # 'groups' data.frame for plot function: in the case, there are no groups:
##D groups.vec<-unlist(apply(data.frame(clones.ind$unique_CDR3_sequences_AA),1,
##D           function(x){strsplit(x,split=", ")[[1]]}))
##D groups.vec<-cbind(groups.vec, 1)
##D 
##D plotDistPCoA(pcoa.tab = distpcoa, groups=groups.vec, axes = c(1,2), 
##D      plotCorrection = FALSE, title = NULL, plotLegend=T, PDF = "TEST")    
## End(Not run)



