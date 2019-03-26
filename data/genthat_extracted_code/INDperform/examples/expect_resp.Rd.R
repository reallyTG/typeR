library(INDperform)


### Name: expect_resp
### Title: Score adjustments for sub-criterion 10.1
### Aliases: expect_resp

### ** Examples

## No test: 
 # Using the Baltic Sea demo data:
 # Apply first the scoring on the model outputs
 scores_tbl <- scoring(trend_tbl = model_trend_ex, mod_tbl = all_results_ex,
   press_type = press_type_ex)
 # Then run the expect_resp() shiny function to correct one criterion
 scores_tbl <- expect_resp(all_results_ex, scores_tbl)
 # Check if it worked:
 expect_resp(all_results_ex, scores_tbl)
## End(No test)



