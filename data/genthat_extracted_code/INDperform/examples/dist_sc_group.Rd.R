library(INDperform)


### Name: dist_sc_group
### Title: Distance matrix averaged across group scores
### Aliases: dist_sc_group

### ** Examples

# Using the Baltic Sea demo data
scores_tbl <- scoring(trend_tbl = model_trend_ex,
  mod_tbl = all_results_ex, press_type = press_type_ex)
scores_mat <- summary_sc(scores_tbl)$scores_matrix
# Split the scores by pressure-independent criteria and pressure types
dist_matrix <- dist_sc_group(x = list(
 scores_mat[,1:2], scores_mat[,3:8],
 scores_mat[,9:12], scores_mat[,13:16]) )



