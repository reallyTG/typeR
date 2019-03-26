library(mlflow)


### Name: mlflow_rfunc_serve
### Title: Serve an RFunc MLflow Model
### Aliases: mlflow_rfunc_serve

### ** Examples

## Not run: 
##D library(mlflow)
##D 
##D # save simple model with constant prediction
##D mlflow_save_model(function(df) 1, "mlflow_constant")
##D 
##D # serve an existing model over a web interface
##D mlflow_rfunc_serve("mlflow_constant")
##D 
##D # request prediction from server
##D httr::POST("http://127.0.0.1:8090/predict/")
## End(Not run)



