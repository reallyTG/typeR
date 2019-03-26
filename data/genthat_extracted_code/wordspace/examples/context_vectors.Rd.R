library(wordspace)


### Name: context.vectors
### Title: Compute Bag-of-Words Context Vectors (wordspace)
### Aliases: context.vectors

### ** Examples


# illustration of WSD algorithm: 6 sentences each for two senses of "vessel"
VesselWSD <- subset(SemCorWSD, target == "vessel")
with(VesselWSD, cat(paste0(sense, ": ", sentence, "\n")))

# provide sense labels in case some contexts are dropped b/c of too many missing words
Centroids <- with(VesselWSD, context.vectors(DSM_Vectors, lemma, row.names=sense))
Centroids[, 1:5]

(res <- kmeans(Centroids, 2)$cluster) # flat clustering with k-means
table(rownames(Centroids), res)       # ... works perfectly

## Not run: 
##D plot(hclust(dist.matrix(Centroids, as.dist=TRUE)))
## End(Not run)



