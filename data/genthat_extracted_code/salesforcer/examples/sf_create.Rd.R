library(salesforcer)


### Name: sf_create
### Title: Create Records
### Aliases: sf_create

### ** Examples

## Not run: 
##D n <- 3
##D new_contacts <- tibble(FirstName = rep("Test", n),
##D                        LastName = paste0("Contact", 1:n))
##D new_contacts_result <- sf_create(new_contacts, object_name="Contact")
##D new_contacts_result <- sf_create(new_contacts, object_name="Contact", api_type="REST")
## End(Not run)



