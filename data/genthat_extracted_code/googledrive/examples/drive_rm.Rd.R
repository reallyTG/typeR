library(googledrive)


### Name: drive_rm
### Title: Delete files from Drive
### Aliases: drive_rm

### ** Examples

## Not run: 
##D ## Create something to remove
##D drive_upload(drive_example("chicken.txt"), name = "chicken-rm.txt")
##D 
##D ## Remove it by name
##D drive_rm("chicken-rm.txt")
##D 
##D ## Create several things to remove
##D x1 <- drive_upload(drive_example("chicken.txt"), name = "chicken-abc.txt")
##D drive_upload(drive_example("chicken.txt"), name = "chicken-def.txt")
##D x2 <- drive_upload(drive_example("chicken.txt"), name = "chicken-ghi.txt")
##D 
##D ## Remove them all at once, specified in different ways
##D drive_rm(x1, "chicken-def.txt", as_id(x2))
## End(Not run)



