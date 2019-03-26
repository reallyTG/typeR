library(salesforcer)


### Name: sf_retrieve
### Title: Retrieve Records By Id
### Aliases: sf_retrieve

### ** Examples

## Not run: 
##D n <- 3
##D new_contacts <- tibble(FirstName = rep("Test", n),
##D                        LastName = paste0("Contact", 1:n))
##D new_contacts_result <- sf_create(new_contacts, object_name="Contact")
##D retrieved_records <- sf_retrieve(ids=new_contacts_result$id,
##D                                  fields=c("LastName"),
##D                                  object_name="Contact")
## End(Not run)



