library(sbtools)


### Name: item_list_files
### Title: Get list of files attached to SB item
### Aliases: item_list_files

### ** Examples

## Not run: 
##D item_list_files("4f4e4b24e4b07f02db6aea14")
##D 
##D # list files recursively
##D ## create item
##D id <- item_create(user_id(), title="some title")
##D ## 1. create nested item w/ file
##D file <- system.file("examples", "books.json", package = "sbtools")
##D id2 <- item_create(id, title = "newest-thing")
##D item_upload_create(id2, file)
##D ## 2. create nested item w/ file
##D file <- system.file("examples", "species.json", package = "sbtools")
##D id3 <- item_create(id, title = "a-new-thing")
##D item_upload_create(id3, file)
##D ## 3. create nested item w/ file
##D file <- system.file("examples", "data.csv", package = "sbtools")
##D id4 <- item_create(id, title = "another-thing")
##D item_upload_create(id4, file)
##D item_list_files(id = '56562348e4b071e7ea53e09d', recursive = FALSE) # default
##D item_list_files(id = '56562348e4b071e7ea53e09d', recursive = TRUE)
## End(Not run)



