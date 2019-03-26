library(salesforcer)


### Name: sf_upsert_metadata
### Title: Upsert Object or Field Metadata in Salesforce
### Aliases: sf_upsert_metadata

### ** Examples

## Not run: 
##D # create an object that we can confirm the update portion of the upsert
##D base_obj_name <- "Custom_Account1"
##D custom_object <- list()
##D custom_object$fullName <- paste0(base_obj_name, "__c")
##D custom_object$label <- paste0(gsub("_", " ", base_obj_name))
##D custom_object$pluralLabel <- paste0(base_obj_name, "s")
##D custom_object$nameField <- list(displayFormat = 'AN-{0000}', 
##D                                 label = paste0(base_obj_name, ' Number'), 
##D                                 type = 'AutoNumber')
##D custom_object$deploymentStatus <- 'Deployed'
##D custom_object$sharingModel <- 'ReadWrite'
##D custom_object$enableActivities <- 'true'
##D custom_object$description <- paste0(base_obj_name, " created by the Metadata API")
##D custom_object_result <- sf_create_metadata(metadata_type = 'CustomObject',
##D                                            metadata = custom_object)
##D # now update the object that was created
##D upsert_metadata <- list(custom_object, custom_object)
##D upsert_metadata[[1]]$fullName <- 'Custom_Account1__c'
##D upsert_metadata[[1]]$label <- 'New Label Custom_Account1'
##D upsert_metadata[[1]]$pluralLabel <- 'Custom_Account1s_new'
##D upsert_metadata[[2]]$fullName <- 'Custom_Account2__c'
##D upsert_metadata[[2]]$label <- 'New Label Custom_Account2'
##D upsert_metadata[[2]]$pluralLabel <- 'Custom_Account2s_new'
##D upserted_custom_object_result <- sf_upsert_metadata(metadata_type = 'CustomObject',
##D                                                     metadata = upsert_metadata)
## End(Not run)



