library(googledrive)


### Name: drive_mv
### Title: Move a Drive file
### Aliases: drive_mv

### ** Examples

## Not run: 
##D ## create a file to move
##D file <- drive_upload(drive_example("chicken.txt"), "chicken-mv.txt")
##D 
##D ## rename it, but leave in current folder (root folder, in this case)
##D file <- drive_mv(file, "chicken-mv-renamed.txt")
##D 
##D ## create a folder to move the file into
##D folder <- drive_mkdir("mv-folder")
##D 
##D ## move the file and rename it again,
##D ## specify destination as a dribble
##D file <- drive_mv(file, path = folder, name = "chicken-mv-re-renamed.txt")
##D 
##D ## verify renamed file is now in the folder
##D drive_ls(folder)
##D 
##D ## move the file back to root folder
##D file <- drive_mv(file, "~/")
##D 
##D ## move it again
##D ## specify destination as path with trailing slash
##D ## to ensure we get a move vs. renaming it to "mv-folder"
##D file <- drive_mv(file, "mv-folder/")
##D 
##D ## Clean up
##D drive_rm(file, folder)
## End(Not run)



