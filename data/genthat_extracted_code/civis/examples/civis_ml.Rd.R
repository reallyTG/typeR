library(civis)


### Name: civis_ml
### Title: Interface for modeling in the Civis Platform
### Aliases: civis_ml civis_ml_fetch_existing predict.civis_ml

### ** Examples

## Not run: 
##D # From a data frame:
##D m <- civis_ml(df, model_type = "sparse_logistic",
##D               dependent_variable = "Species")
##D 
##D # From a table:
##D m <- civis_ml(civis_table("schema.table", "database_name"),
##D               model_type = "sparse_logistic", dependent_variable = "Species",
##D               oos_scores_table = "schema.scores_table",
##D               oos_scores_if_exists = "drop")
##D 
##D # From a local file:
##D m <- civis_ml("path/to/file.csv", model_type = "sparse_logistic",
##D               dependent_variable = "Species")
##D 
##D # From a Civis file:
##D file_id <- write_civis_file("path/to/file.csv", name = "file.csv")
##D m <- civis_ml(civis_file(file_id), model_type = "sparse_logistic",
##D               dependent_variable = "Species")
##D 
##D pred_job <- predict(m, newdata = df)
##D pred_job <- predict(m, civis_table("schema.table", "database_name"),
##D                     output_table = "schema.scores_table")
##D pred_job <- predict(m, civis_file(file_id),
##D                     output_table = "schema.scores_table")
##D 
##D m <- civis_ml_fetch_existing(model_id = m$job$id, m$run$id)
##D logs <- fetch_logs(m)
##D yhat <- fetch_oos_scores(m)
##D yhat <- fetch_predictions(pred_job)
## End(Not run)



