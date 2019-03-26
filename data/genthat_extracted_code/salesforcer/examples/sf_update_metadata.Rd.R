library(salesforcer)


### Name: sf_update_metadata
### Title: Update Object or Field Metadata in Salesforce
### Aliases: sf_update_metadata

### ** Examples

## Not run: 
##D # create an object that we can update
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
##D update_metadata <- custom_object 
##D update_metadata$fullName <- 'Custom_Account1__c'
##D update_metadata$label <- 'New Label Custom_Account1'
##D update_metadata$pluralLabel <- 'Custom_Account1s_new'
##D updated_custom_object_result <- sf_update_metadata(metadata_type = 'CustomObject',
##D                                                    metadata = update_metadata)
## End(Not run)



