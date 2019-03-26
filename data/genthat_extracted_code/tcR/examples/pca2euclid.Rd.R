library(tcR)


### Name: pca2euclid
### Title: Compute the Euclidean distance among principal components.
### Aliases: pca2euclid

### ** Examples

## Not run: 
##D mat.ov <- repOverlap(AS_DATA, .norm = T)
##D mat.gen.pca <- pca.segments(AS_DATA, T, .genes = HUMAN_TRBV)
##D mat.ov.pca <- prcomp(mat.ov, scale. = T)
##D mat.gen.pca.dist <- pca2euclid(mat.gen.pca)
##D mat.ov.pca.dist <- pca2euclid(mat.ov.pca)
##D permutDistTest(mat.gen.pca.dist, list(<list of groups here>))
##D permutDistTest(mat.ov.pca.dist, list(<list of groups here>))
## End(Not run)



