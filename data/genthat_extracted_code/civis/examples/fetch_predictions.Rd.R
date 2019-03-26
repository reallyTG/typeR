library(civis)


### Name: fetch_predictions
### Title: Retrieve predictions from a CivisML prediction job
### Aliases: fetch_predictions

### ** Examples

## Not run: 
##D m <- civis_ml("path/to/file.csv", model_type = "sparse_logistic",
##D   dependent_variable = "Species")
##D pred_job <- predict(m, newdata = "path/to/newdata.csv")
##D yhat <- fetch_predictions(pred_job)
##D 
##D # download instead:
##D download_civis(pred_job$model_info$output_file_ids, path = "my_predictions.csv")
##D 
## End(Not run)



