library(factoextra)


### Name: hkmeans
### Title: Hierarchical k-means clustering
### Aliases: hkmeans print.hkmeans hkmeans_tree

### ** Examples

## No test: 
# Load data
data(USArrests)
# Scale the data
df <- scale(USArrests)

# Compute hierarchical k-means clustering
res.hk <-hkmeans(df, 4)

# Elements returned by hkmeans()
names(res.hk)

# Print the results
res.hk

# Visualize the tree
hkmeans_tree(res.hk, cex = 0.6)
# or use this
fviz_dend(res.hk, cex = 0.6)


# Visualize the hkmeans final clusters
fviz_cluster(res.hk, frame.type = "norm", frame.level = 0.68)
## End(No test)



