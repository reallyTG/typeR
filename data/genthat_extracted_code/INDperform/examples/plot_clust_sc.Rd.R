library(INDperform)


### Name: plot_clust_sc
### Title: Dendrogram of the cluster analysis.
### Aliases: plot_clust_sc

### ** Examples

# Using the Baltic Sea demo data
scores_tbl <- scoring(trend_tbl = model_trend_ex,
  mod_tbl = all_results_ex, press_type = press_type_ex)
dist_matrix <- dist_sc(scores_tbl, method_dist = "euclidean")
clust_analysis <- clust_sc(dist_matrix, method_clust = "complete")
plot_clust_sc(clust_analysis)

# To modify the plot:
plot_clust_sc(clust_analysis, rotate = TRUE, text_size = 20) +
 ggplot2::theme(title = ggplot2::element_text(colour = "blue", size = 10))



