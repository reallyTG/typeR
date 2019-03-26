library(factoextra)


### Name: fviz_silhouette
### Title: Visualize Silhouette Information from Clustering
### Aliases: fviz_silhouette

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
km.res <- kmeans(iris.scaled, 3, nstart = 2)

# Visualize kmeans clustering
fviz_cluster(km.res, iris[, -5], ellipse.type = "norm")+
theme_minimal()

# Visualize silhouhette information
require("cluster")
sil <- silhouette(km.res$cluster, dist(iris.scaled))
fviz_silhouette(sil)

# Identify observation with negative silhouette
neg_sil_index <- which(sil[, "sil_width"] < 0)
sil[neg_sil_index, , drop = FALSE]
## Not run: 
##D # PAM clustering
##D # ++++++++++++++++++++
##D require(cluster)
##D pam.res <- pam(iris.scaled, 3)
##D # Visualize pam clustering
##D fviz_cluster(pam.res, ellipse.type = "norm")+
##D theme_minimal()
##D # Visualize silhouhette information
##D fviz_silhouette(pam.res)
##D 
##D # Hierarchical clustering
##D # ++++++++++++++++++++++++
##D # Use hcut() which compute hclust and cut the tree
##D hc.cut <- hcut(iris.scaled, k = 3, hc_method = "complete")
##D # Visualize dendrogram
##D fviz_dend(hc.cut, show_labels = FALSE, rect = TRUE)
##D # Visualize silhouhette information
##D fviz_silhouette(hc.cut)
## End(Not run)



