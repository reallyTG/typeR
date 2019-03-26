library(civis)


### Name: civis_ml_gradient_boosting_classifier
### Title: CivisML Gradient Boosting Classifier
### Aliases: civis_ml_gradient_boosting_classifier

### ** Examples

## Not run: 
##D  df <- iris
##D  names(df) <- stringr::str_replace(names(df), "\\.", "_")
##D 
##D  m <- civis_ml_gradient_boosting_classifier(df,
##D    dependent_variable = "Species",
##D    learning_rate = .01,
##D    n_estimators = 100,
##D    subsample = .5,
##D    max_depth = 5,
##D    max_features = NULL)
##D  yhat <- fetch_oos_scores(m)
##D 
##D # Grid Search
##D cv_params <- list(
##D    n_estimators = c(100, 200, 500),
##D    learning_rate = c(.01, .1),
##D    max_depth = c(2, 3))
##D 
##D m <- civis_ml_gradient_boosting_classifier(df,
##D    dependent_variable = "Species",
##D    subsample = .5,
##D    max_features = NULL,
##D    cross_validation_parameters = cv_params)
##D 
##D pred_info <- predict(m,  civis_table("schema.table", "my_database"),
##D    output_table = "schema.scores_table")
## End(Not run)



