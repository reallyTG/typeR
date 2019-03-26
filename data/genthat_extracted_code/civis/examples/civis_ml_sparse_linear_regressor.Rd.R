library(civis)


### Name: civis_ml_sparse_linear_regressor
### Title: CivisML Sparse Linear Regression
### Aliases: civis_ml_sparse_linear_regressor

### ** Examples

## Not run: 
##D  data(ChickWeight)
##D  m <- civis_ml_sparse_linear_regressor(ChickWeight, dependent_variable = "weight")
##D  yhat <- fetch_oos_scores(m)
##D 
##D # make a prediction job, storing in a redshift table
##D pred_info <- predict(m, newdata = civis_table("schema.table", "my_database"),
##D    output_table = "schema.scores_table")
##D 
## End(Not run)



