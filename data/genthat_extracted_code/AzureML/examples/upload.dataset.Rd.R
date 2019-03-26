library(AzureML)


### Name: upload.dataset
### Title: Upload an R data frame to an AzureML workspace.
### Aliases: upload.dataset

### ** Examples

## Not run: 
##D   library(AzureML)
##D   
##D   ws <- workspace()
##D   
##D   # Upload the R airquality data.frame to the workspace.
##D   upload.dataset(airquality, ws, "airquality")
##D 
##D   # Example datasets (airquality should be among them now)
##D   head(datasets(ws))
##D 
##D   # Now delete what we've just uploaded
##D   delete.datasets(ws, "airquality")
## End(Not run)



