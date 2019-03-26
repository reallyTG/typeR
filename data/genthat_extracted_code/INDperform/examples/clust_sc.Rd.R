library(INDperform)


### Name: clust_sc
### Title: Score-based cluster analysis
### Aliases: clust_sc

### ** Examples

# Using the Baltic Sea demo data
scores_tbl <- scoring(trend_tbl = model_trend_ex,
  mod_tbl = all_results_ex, press_type = press_type_ex)
dist_matrix <- dist_sc(scores_tbl, method_dist = "euclidean")
clust_analysis <- clust_sc(dist_matrix, method_clust = "complete")



