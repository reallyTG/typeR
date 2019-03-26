library(civis)


### Name: civis_ml_sparse_ridge_regressor
### Title: CivisML Sparse Ridge Regression
### Aliases: civis_ml_sparse_ridge_regressor

### ** Examples

## Not run: 
##D  data(ChickWeight)
##D  m <- civis_ml_sparse_ridge_regressor(ChickWeight, dependent_variable = "weight", alpha = 999)
##D  yhat <- fetch_oos_scores(m)
##D 
##D  # Grid search
##D  cv_params <- list(alpha = c(.001, .01, .1, 1))
##D  m <- civis_ml_sparse_ridge_regressor(ChickWeight,
##D    dependent_variable = "weight",
##D    cross_validation_parameters = cv_params,
##D    calibration = NULL)
##D 
##D # make a prediction job, storing in a redshift table
##D pred_info <- predict(m, newdata = civis_table("schema.table", "my_database"),
##D    output_table = "schema.scores_table")
## End(Not run)



