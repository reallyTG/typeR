library(salesforcer)


### Name: sf_bulk_operation
### Title: Run Bulk Operation
### Aliases: sf_bulk_operation

### ** Examples

## Not run: 
##D n <- 20
##D new_contacts <- tibble(FirstName = rep("Test", n), 
##D                        LastName = paste0("Contact", 1:n))
##D # insert new records into the Contact object
##D inserts <- sf_bulk_operation(input_data = new_contacts, 
##D                              object_name = "Contact", 
##D                              operation = "insert")
## End(Not run)



