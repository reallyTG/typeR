library(sbtools)


### Name: items_create
### Title: Create many new SB items
### Aliases: items_create

### ** Examples

## Not run: 
##D # helper function to make a random name
##D aname <- function() paste0(sample(letters, size = 5, replace = TRUE), collapse = "")
##D 
##D # Create some items - by default we use your user ID
##D items_create(title = c(aname(), aname()))
##D 
##D # add additional items in the info parameter - by default we use your user ID
##D items_create(title = c(aname(), aname()), 
##D 		info = list(
##D 						list(contacts = list(list(name = "Suzy"))), 
##D 						list(contacts = list(list(name = "Brandy")))
##D 					)
##D 	)
##D 	
##D # another example with more information - by default we use your user ID
##D items_create(title = c(aname(), aname()), 
##D 		info = list(
##D 						list(contacts = list(list(name = "Suzy"))), 
##D 						list(contacts = list(list(name = "Brandy")))
##D 					)
##D 	)	
##D 
##D # Pass an object of class sbitem
##D (x <- folder_create(user_id(), aname()))
##D items_create(x, title = c(aname(), aname()))
## End(Not run)



