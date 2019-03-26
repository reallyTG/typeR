library(rdhs)


### Name: data_and_labels
### Title: Create list of dataset and its variable names
### Aliases: data_and_labels

### ** Examples

## Not run: 
##D # get the model datasets included with the package
##D model_datasets <- model_datasets
##D 
##D # download one of them
##D g <- get_datasets(dataset_filenames = model_datasets$FileName[1])
##D dl <- data_and_labels(g$zzbr62dt)
##D 
##D # now we easily have our survey question labels easily accessible
##D grep("bed net", dl$variable_names$description, value = TRUE)
## End(Not run)



