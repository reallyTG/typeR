library(INDperform)


### Name: scoring
### Title: Scoring of indicator performance
### Aliases: scoring

### ** Examples

# Using the Baltic Sea demo data in this package
scores_tbl <- scoring(trend_tbl = model_trend_ex, mod_tbl = all_results_ex,
  press_type = press_type_ex)
## No test: 
 # To see the criterion template and change it potentially
 View(crit_scores_tmpl)
 # E.g. exclude the trend criterion
 crit_scores_tmpl_new <- crit_scores_tmpl[crit_scores_tmpl$crit_id > 1, ]
 # Now the trend tibble is not needed anymore
 scores_tbl <- scoring(mod_tbl = all_results_ex, press_type = press_type_ex,
  crit_scores = crit_scores_tmpl_new)
## End(No test)



