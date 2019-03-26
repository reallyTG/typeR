library(salesforcer)


### Name: sf_delete
### Title: Delete Records
### Aliases: sf_delete

### ** Examples

## Not run: 
##D n <- 3
##D new_contacts <- tibble(FirstName = rep("Test", n),
##D                        LastName = paste0("Contact", 1:n))
##D new_contacts_result1 <- sf_create(new_contacts, object_name="Contact")
##D deleted_contacts_result1 <- sf_delete(new_contacts_result1$id, 
##D                                       object_name="Contact")   
##D 
##D new_contacts_result2 <- sf_create(new_contacts, "Contact")
##D deleted_contacts_result2 <- sf_delete(new_contacts_result2$id, 
##D                                       object_name="Contact", 
##D                                       api_type="Bulk")                             
## End(Not run)



