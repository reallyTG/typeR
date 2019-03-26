library(qiimer)


### Name: otu_heatmap
### Title: Create a heatmap of OTU counts.
### Aliases: otu_heatmap

### ** Examples

data(relmbeta_assignments)
data(relmbeta_counts)
a <- simplify_assignments(split_assignments(relmbeta_assignments))

## Not run: 
##D otu_heatmap(relmbeta_counts, a, threshold=10)
##D otu_heatmap(
##D   relmbeta_counts, a, threshold=10, 
##D   cluster_rows=FALSE, cluster_cols=FALSE, 
##D   cellwidth=12, cellheight=12)
## End(Not run)

heatmap_data <- otu_heatmap(relmbeta_counts, a, threshold=10, plot=FALSE)
head(heatmap_data)



