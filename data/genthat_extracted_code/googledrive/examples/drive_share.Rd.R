library(googledrive)


### Name: drive_share
### Title: Share Drive files
### Aliases: drive_share

### ** Examples

## Not run: 
##D ## Upload a file to share
##D file <- drive_upload(
##D    drive_example("chicken.txt"),
##D    name = "chicken-share.txt",
##D    type = "document"
##D )
##D 
##D ## Let a specific person comment
##D file <- file %>%
##D   drive_share(
##D     role = "commenter",
##D     type = "user",
##D     emailAddress = "susan@example.com"
##D )
##D 
##D ## Let a different specific person edit and customize the email notification
##D file <- file %>%
##D   drive_share(
##D     role = "writer",
##D     type = "user",
##D     emailAddress = "carol@example.com",
##D     emailMessage = "Would appreciate your feedback on this!"
##D )
##D 
##D ## Let anyone read the file
##D file <- file %>%
##D   drive_share(role = "reader", type = "anyone")
##D 
##D ## Clean up
##D drive_rm(file)
## End(Not run)



