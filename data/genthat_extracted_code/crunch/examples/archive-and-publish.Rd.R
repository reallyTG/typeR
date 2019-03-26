library(crunch)


### Name: is.archived,DatasetCatalog-method
### Title: Get and set "archived" and "published" status of a dataset
### Aliases: is.archived,DatasetCatalog-method
###   is.draft,DatasetCatalog-method is.published,DatasetCatalog-method
###   is.archived<-,DatasetCatalog,logical-method
###   is.draft<-,DatasetCatalog,logical-method
###   is.published<-,DatasetCatalog,logical-method archive-and-publish
###   archive is.archived is.draft is.published is.archived<- is.draft<-
###   is.published<- publish is.archived,CrunchDataset-method
###   is.draft,CrunchDataset-method is.published,CrunchDataset-method
###   is.archived<-,CrunchDataset,logical-method
###   is.draft<-,CrunchDataset,logical-method
###   is.published<-,CrunchDataset,logical-method

### ** Examples

## Not run: 
##D ds <- loadDataset("mtcars")
##D is.draft(ds)     # FALSE
##D is.published(ds) # TRUE
##D identical(is.draft(ds), !is.published(ds))
##D # Can make a dataset a "draft" by:
##D is.draft(ds) <- TRUE
##D is.published(ds) # FALSE
##D # Could also have set is.published(ds) <- FALSE
##D # Now, can go the other way by setting is.draft, is.published, or:
##D ds <- publish(ds)
##D is.published(ds) # TRUE
##D 
##D is.archived(ds)  # FALSE
##D is.archived(ds) <- TRUE
##D is.archived(ds)  # TRUE
##D # Could have achieved the same effect by:
##D ds <- archive(ds)
## End(Not run)



