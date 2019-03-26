library(tcR)


### Name: repOverlap
### Title: General function for the repertoire overlap evaluation.
### Aliases: repOverlap

### ** Examples

## Not run: 
##D data(twb)
##D repOverlap(twb, "exact", .seq = "nuc", .vgene = F)
##D repOverlap(twb, "morisita", .seq = "aa", .vgene = T, .quant = "umi.count")
##D ov <- repOverlap(twb)
##D ov[is.na(ov)] <- 0
##D vis.pca(prcomp(ov, scale. = T), list(A = c(1, 2), B = c(3, 4)))
## End(Not run)



