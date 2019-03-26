library(civis)


### Name: civis_ml_sparse_logistic
### Title: CivisML Sparse Logistic
### Aliases: civis_ml_sparse_logistic

### ** Examples

## Not run: 
##D 
##D df <- iris
##D names(df) <- stringr::str_replace(names(df), "\\.", "_")
##D 
##D m <- civis_ml_sparse_logistic(df, "Species")
##D yhat <- fetch_oos_scores(m)
##D 
##D # Grid Search
##D cv_params <- list(C = c(.01, 1, 10, 100, 1000))
##D 
##D m <- civis_ml_sparse_logistic(df, "Species",
##D   cross_validation_parameters = cv_params)
##D 
##D # make a prediction job, storing in a redshift table
##D pred_info <- predict(m, newdata = civis_table("schema.table", "my_database"),
##D    output_table = "schema.scores_table")
##D 
## End(Not run)



