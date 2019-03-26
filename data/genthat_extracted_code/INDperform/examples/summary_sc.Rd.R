library(INDperform)


### Name: summary_sc
### Title: Summary of indicator performance scores
### Aliases: summary_sc

### ** Examples

# Using the Baltic Sea demo data in this package
scores_tbl <- scoring(trend_tbl = model_trend_ex, mod_tbl = all_results_ex,
  press_type = press_type_ex)
summary_sc(scores_tbl)



