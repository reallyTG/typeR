library(googledrive)


### Name: drive_mkdir
### Title: Create a Drive folder
### Aliases: drive_mkdir

### ** Examples

## Not run: 
##D ## Create folder named 'ghi', then another below named it 'jkl' and star it
##D ghi <- drive_mkdir("ghi")
##D jkl <- drive_mkdir("ghi/jkl", starred = TRUE)
##D 
##D ## is 'jkl' really starred? YES
##D purrr::pluck(jkl, "drive_resource", 1, "starred")
##D 
##D ## Another way to create folder 'mno' in folder 'ghi'
##D drive_mkdir("mno", parent = "ghi")
##D 
##D ## Yet another way to create a folder named 'pqr' in folder 'ghi',
##D ## this time with parent folder stored in a dribble,
##D ## and setting the new folder's description
##D pqr <- drive_mkdir("pqr", parent = ghi, description = "I am a folder")
##D 
##D ## Did we really set the description? YES
##D purrr::pluck(pqr, "drive_resource", 1, "description")
##D 
##D ## clean up
##D drive_rm(ghi)
## End(Not run)



