library(factoextra)


### Name: fviz_dend
### Title: Enhanced Visualization of Dendrogram
### Aliases: fviz_dend

### ** Examples

## No test: 
# Load and scale the data
data(USArrests)
df <- scale(USArrests)

# Hierarchical clustering
res.hc <- hclust(dist(df))

# Default plot
fviz_dend(res.hc)

# Cut the tree
fviz_dend(res.hc, cex = 0.5, k = 4, color_labels_by_k = TRUE)

# Don't color labels, add rectangles
fviz_dend(res.hc, cex = 0.5, k = 4, 
 color_labels_by_k = FALSE, rect = TRUE)
 
# Change the color of tree using black color for all groups
# Change rectangle border colors
fviz_dend(res.hc, rect = TRUE, k_colors ="black",
rect_border = 2:5, rect_lty = 1)

# Customized color for groups
fviz_dend(res.hc, k = 4, 
 k_colors = c("#1B9E77", "#D95F02", "#7570B3", "#E7298A"))
 
 
 # Color labels using k-means clusters
 km.clust <- kmeans(df, 4)$cluster
 fviz_dend(res.hc, k = 4, 
   k_colors = c("blue", "green3", "red", "black"),
   label_cols =  km.clust[res.hc$order], cex = 0.6)

## End(No test)



