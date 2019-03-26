library(salesforcer)


### Name: sf_upsert
### Title: Upsert Records
### Aliases: sf_upsert

### ** Examples

## Not run: 
##D n <- 2
##D new_contacts <- tibble(FirstName = rep("Test", n),
##D                        LastName = paste0("Contact-Create-", 1:n),
##D                        My_External_Id__c=letters[1:n])
##D new_contacts_result <- sf_create(new_contacts, object_name="Contact")
##D 
##D upserted_contacts <- tibble(FirstName = rep("Test", n),
##D                             LastName = paste0("Contact-Upsert-", 1:n),
##D                             My_External_Id__c=letters[1:n])
##D new_record <- tibble(FirstName = "Test",
##D                      LastName = paste0("Contact-Upsert-", n+1),
##D                      My_External_Id__c=letters[n+1])
##D upserted_contacts <- bind_rows(upserted_contacts, new_record)
##D 
##D upserted_contacts_result1 <- sf_upsert(upserted_contacts, 
##D                                        object_name="Contact", 
##D                                        "My_External_Id__c")
## End(Not run)



