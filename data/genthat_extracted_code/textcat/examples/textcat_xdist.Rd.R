library(textcat)


### Name: textcat_xdist
### Title: Cross-Distances Between N-Gram Profiles
### Aliases: textcat_xdist

### ** Examples

## Compute cross-distances between the TextCat byte profiles using the
## CT out-of-place measure.
d <- textcat_xdist(TC_byte_profiles)
## Visualize results of hierarchical cluster analysis on the distances.
plot(hclust(as.dist(d)), cex = 0.7)



