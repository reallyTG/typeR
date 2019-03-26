library(AzureML)


### Name: experiments
### Title: List experiments in an AzureML workspace.
### Aliases: experiments

### ** Examples

## Not run: 
##D   library(AzureML)
##D   
##D   experiment <- "dd01c7e4a424432c9a9f83142d5cfec4.f-id.d2f351dd4cec4c06a4592ac83f7af55a"
##D   node_id <- '2a472ae1-ecb1-4f40-ae4e-cd3cecb1003f-268'
##D   
##D   ws <- workspace()
##D   
##D   ws$experiments
##D   experiments(ws)
##D   frame <- download.intermediate.dataset(ws, experiment, node_id,
##D                                          port_name = "Results dataset", 
##D                                          data_type_id = "GenericCSV")
##D   head(frame)
## End(Not run)



