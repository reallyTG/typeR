library(repo)


### Name: repo_bulkedit
### Title: Edit all items info using a text file.
### Aliases: repo_bulkedit

### ** Examples

rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)
rp$put(1, "item1", "Sample item 1", c("tag1", "tag2"))

items_data_file <- tempfile()
rp$bulkedit(items_data_file)
## Manually edit items_data_file, then update items:
rp$bulkedit(infile=items_data_file)

## wiping temporary repo
unlink(rp_path, TRUE)



