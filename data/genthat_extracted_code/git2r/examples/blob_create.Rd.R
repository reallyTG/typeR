library(git2r)


### Name: blob_create
### Title: Create blob from file on disk
### Aliases: blob_create

### ** Examples

## Not run: 
##D ## Initialize a temporary repository
##D path <- tempfile(pattern="git2r-")
##D dir.create(path)
##D repo <- init(path)
##D 
##D ## Create blobs from files relative to workdir
##D writeLines("Hello, world!", file.path(path, "example-1.txt"))
##D writeLines("test content", file.path(path, "example-2.txt"))
##D blob_list_1 <- blob_create(repo, c("example-1.txt",
##D                                    "example-2.txt"))
##D 
##D ## Create blobs from files not relative to workdir
##D temp_file_1 <- tempfile()
##D temp_file_2 <- tempfile()
##D writeLines("Hello, world!", temp_file_1)
##D writeLines("test content", temp_file_2)
##D blob_list_2 <- blob_create(repo, c(temp_file_1, temp_file_2), relative = FALSE)
## End(Not run)



