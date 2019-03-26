library(salesforcer)


### Name: sf_create_metadata
### Title: Create Object or Field Metadata in Salesforce
### Aliases: sf_create_metadata

### ** Examples

## Not run: 
##D # read the metadata of the existing Account object
##D # we will use this object as a template to create a custom version
##D metadata_info <- sf_read_metadata(metadata_type='CustomObject',
##D                                   object_names=c('Account'))
##D custom_metadata <- metadata_info[[1]]
##D # remove default actionOverrides, this cannot be set during creation
##D custom_metadata[which(names(custom_metadata) %in% c("actionOverrides"))] <- NULL
##D # remove fields since its a custom object and the standard ones no longer exist
##D custom_metadata[which(names(custom_metadata) %in% c("fields"))] <- NULL
##D # remove views so that we get the Standard List Views
##D custom_metadata[which(names(custom_metadata) %in% c("listViews"))] <- NULL
##D # remove links so that we get the Standard Web Links
##D custom_metadata[which(names(custom_metadata) %in% c("webLinks"))] <- NULL
##D # now make some adjustments to customize the object
##D this_label <- 'Custom_Account43'
##D custom_metadata$fullName <- paste0(this_label, '__c')
##D custom_metadata$label <- this_label
##D custom_metadata$pluralLabel <- paste0(this_label, 's')
##D custom_metadata$nameField <- list(displayFormat='AN-{0000}',
##D                                   label='Account Number',
##D                                   type='AutoNumber')
##D custom_metadata$fields <- list(fullName="Phone__c",
##D                                label="Phone",
##D                                type="Phone")
##D # set the deployment status, this must be set before creation
##D custom_metadata$deploymentStatus <- 'Deployed'
##D # make a description to identify this easily in the UI setup tab
##D custom_metadata$description <- 'created by the Metadata API'
##D new_custom_object <- sf_create_metadata(metadata_type='CustomObject',
##D                                         metadata=custom_metadata, verbose=TRUE)
##D 
##D # adding custom fields to our object 
##D # input formatted as a list
##D custom_fields <- list(list(fullName='Custom_Account43__c.CustomField66__c',
##D                            label='CustomField66',
##D                            length=100,
##D                            type='Text'),
##D                       list(fullName='Custom_Account43__c.CustomField77__c',
##D                            label='CustomField77',
##D                            length=100,
##D                            type='Text'))
##D # formatted as a data.frame
##D custom_fields <- data.frame(fullName=c('Custom_Account43__c.CustomField88__c',
##D                                        'Custom_Account43__c.CustomField99__c'),
##D                             label=c('Test Field1', 'Test Field2'),
##D                             length=c(44,45),
##D                             type=c('Text', 'Text'))
##D new_custom_fields <- sf_create_metadata(metadata_type = 'CustomField', 
##D                                         metadata = custom_fields)
## End(Not run)



