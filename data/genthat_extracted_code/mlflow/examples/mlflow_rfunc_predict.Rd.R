library(mlflow)


### Name: mlflow_rfunc_predict
### Title: Predict using RFunc MLflow Model
### Aliases: mlflow_rfunc_predict

### ** Examples

## Not run: 
##D library(mlflow)
##D 
##D # save simple model which roundtrips data as prediction
##D mlflow_save_model(function(df) df, "mlflow_roundtrip")
##D 
##D # save data as json
##D jsonlite::write_json(iris, "iris.json")
##D 
##D # predict existing model from json data
##D mlflow_rfunc_predict("mlflow_roundtrip", "iris.json")
## End(Not run)




