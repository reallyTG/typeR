library(salesforcer)


### Name: sf_update
### Title: Update Records
### Aliases: sf_update

### ** Examples

## Not run: 
##D n <- 3
##D new_contacts <- tibble(FirstName = rep("Test", n),
##D                        LastName = paste0("Contact", 1:n))
##D new_contacts_result <- sf_create(new_contacts, "Contact")
##D 
##D update_contacts <- tibble(FirstName = rep("TestTest", n),
##D                           LastName = paste0("Contact", 1:n), 
##D                           Id = new_contacts_result$id)
##D updated_contacts_result1 <- sf_update(update_contacts, "Contact")
##D updated_contacts_result2 <- sf_update(update_contacts, "Contact", 
##D                                       api_type="Bulk")
## End(Not run)



