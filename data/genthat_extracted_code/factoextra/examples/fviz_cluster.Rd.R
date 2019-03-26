library(factoextra)


### Name: fviz_cluster
### Title: Visualize Clustering Results
### Aliases: fviz_cluster

### ** Examples

set.seed(123)

# Data preparation
# +++++++++++++++
data("iris")
head(iris)
# Remove species column (5) and scale the data
iris.scaled <- scale(iris[, -5])

# K-means clustering
# +++++++++++++++++++++
km.res <- kmeans(iris.scaled, 3, nstart = 10)

# Visualize kmeans clustering
# use repel = TRUE to avoid overplotting
fviz_cluster(km.res, iris[, -5], ellipse.type = "norm")


# Change the color palette and theme
fviz_cluster(km.res, iris[, -5],
   palette = "Set2", ggtheme = theme_minimal())
 
 ## Not run: 
##D # Show points only
##D fviz_cluster(km.res, iris[, -5], geom = "point")
##D # Show text only
##D fviz_cluster(km.res, iris[, -5], geom = "text")
##D  
##D # PAM clustering
##D # ++++++++++++++++++++
##D require(cluster)
##D pam.res <- pam(iris.scaled, 3)
##D  # Visualize pam clustering
##D fviz_cluster(pam.res, geom = "point", ellipse.type = "norm")
##D 
##D # Hierarchical clustering
##D # ++++++++++++++++++++++++
##D # Use hcut() which compute hclust and cut the tree
##D hc.cut <- hcut(iris.scaled, k = 3, hc_method = "complete")
##D # Visualize dendrogram
##D fviz_dend(hc.cut, show_labels = FALSE, rect = TRUE)
##D # Visualize cluster
##D fviz_cluster(hc.cut, ellipse.type = "convex")
##D 
## End(Not run)






