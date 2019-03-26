library(civis)


### Name: civis_ml_random_forest_regressor
### Title: CivisML Random Forest Regressor
### Aliases: civis_ml_random_forest_regressor

### ** Examples

## Not run: 
##D data(ChickWeight)
##D 
##D m <- civis_ml_random_forest_regressor(ChickWeight,
##D   dependent_variable = "weight",
##D   n_estimators = 100,
##D   max_depth = 5,
##D   max_features = NULL)
##D yhat <- fetch_oos_scores(m)
##D 
##D # Grid Search
##D cv_params <- list(
##D   n_estimators = c(100, 200, 500),
##D   max_depth = c(2, 3))
##D 
##D m <- civis_ml_random_forest_regressor(ChickWeight,
##D   dependent_variable = "weight",
##D   max_features = NULL,
##D   cross_validation_parameters = cv_params)
##D 
##D pred_info <- predict(m,  civis_table("schema.table", "my_database"),
##D    output_table = "schema.scores_table")
## End(Not run)



