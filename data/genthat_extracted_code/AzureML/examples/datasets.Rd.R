library(AzureML)


### Name: datasets
### Title: List datasets in an AzureML workspace.
### Aliases: datasets

### ** Examples

## Not run: 
##D   library(AzureML)
##D   
##D   # Use the default config file ~/azureml/settings.json with format:
##D   #   {"workspace":{
##D   #     "id":"test_id",
##D   #     "authorization_token": "test_token",
##D   #     "api_endpoint":"api_endpoint",
##D   #     "management_endpoint":"management_endpoint"
##D   #    }}
##D   # or, optionally set the `id` and `auth` parameters in the workspace
##D   # function.
##D   ws <- workspace()
##D   
##D   # List datasets
##D   ws$datasets
##D   datasets(ws)
##D   
##D   dataset <- "New York weather"
##D   ds <- match(dataset, ws$datasets$Name)
##D   frame <- download.datasets(ws$datasets[ds, ])
##D   head(frame)
##D 
##D   # Alternative approach:
##D   frame <- download.datasets(ws, name=dataset)
##D   head(frame)
## End(Not run)



