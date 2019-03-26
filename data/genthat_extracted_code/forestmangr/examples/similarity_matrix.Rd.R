library(forestmangr)


### Name: similarity_matrix
### Title: Get the similarity matrix of an area
### Aliases: similarity_matrix

### ** Examples

library(forestmangr)
data("exfm20")
exfm20

# To get the similarity matrix of an area, we simply need to provide
# the species variable name, and a subdivision variable name, like
# transect. By default we get a a matrix based on the Sorensen index:
similarity_matrix(exfm20, "scientific.name", "transect")

# To get the similarity matrix of Jaccard, use the index argument:
similarity_matrix(exfm20, "scientific.name", "transect", index = "Jaccard")

# To get a dendrogram with the matrix, use dendrogram=TRUE:
similarity_matrix(exfm20, "scientific.name", "transect", index = "Jaccard", dendrogram = TRUE)

# To get a list with both matrices, use index="all":
similarity_matrix(exfm20, "scientific.name", "transect", index = "all")

# If the data supplied only has 2 levels, a paired comparison is made instead:
ex_pair <- exfm20[exfm20$transect %in% c("T01", "T02") , ]
ex_pair

similarity_matrix(ex_pair, "scientific.name", "transect", index = "all")




