library(etseed)


### Name: keys
### Title: List a key or all keys
### Aliases: create create_in_order delete key keys update

### ** Examples

## Not run: 
##D # make a client
##D cli <- etcd()
##D 
##D # Make a key
##D cli$create(key="/mykey", value="this is awesome")
##D cli$create(key="/things", value="and stuff!")
##D ## use ttl (expires after ttl seconds)
##D cli$create(key="/stuff", value="tables", ttl=10)
##D 
##D # Make a directory
##D cli$create(key="/mydir", dir = TRUE)
##D # List a directory
##D cli$key("/mydir")
##D # Make a key inside a directory
##D cli$create("/mydir/key1", value = "foo")
##D cli$create("/mydir/key2", value = "bar")
##D # List again, now with two keys
##D cli$key("/mydir")
##D # Delete a directory
##D cli$delete(key="/mydir", dir = TRUE)
##D 
##D # Update a key
##D cli$update(key="/things", value="and stuff! and more things")
##D 
##D # Create an in-order key
##D cli$create_inorder("/queue", "thing1")
##D cli$create_inorder("/queue", "thing2")
##D cli$create_inorder("/queue", "thing3")
##D cli$key("/queue", sorted = TRUE, recursive = TRUE)
##D 
##D # List all keys
##D cli$keys()
##D cli$keys(sorted = TRUE)
##D cli$keys(recursive = TRUE)
##D cli$keys(sorted = TRUE, recursive = TRUE)
##D 
##D # List a single key
##D cli$key("/mykey")
##D cli$key("/things")
##D 
##D # Waiting
##D ## Wait for a change via long-polling
##D ## in another R session, load etseed, then run the 2nd line of code
##D # cli$key("/anewkey", wait = TRUE)
##D # cli$create("/anewkey", "hey from another R session")
##D ## Wait for change from cleared event index
##D # cli$key("/anewkey", wait = TRUE, wait_index = 7)
##D 
##D # Delete a key
##D cli$create("/hello", "world")
##D cli$delete("/hello")
##D ## Delete only if matches previous value, fails
##D cli$delete("/things", prevValue="two")
##D ## Delete only if matches previous index
##D ### Fails
##D cli$delete("/things", prevIndex=1)
##D ### Works
##D cli$delete("/things", prevIndex=13)
##D 
##D # curl options
##D library("httr")
##D cli$keys(config = verbose())
##D 
##D # Hidden keys
##D ## Create a hidden key using "_" at beginning
##D cli$create("/_message", "my hidden key")
##D ## A key that's not hidden
##D cli$create("/message", "my un-hidden key")
##D ## Call to root directory doesn't show the hidden key
##D cli$keys()
##D 
##D # Set a key from a file
##D # cat("hello\nworld", file = "myfile.txt")
##D # cli$create("/myfile", file = file)
## End(Not run)



