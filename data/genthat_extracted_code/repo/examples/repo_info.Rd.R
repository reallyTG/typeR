library(repo)


### Name: repo_info
### Title: Provides detailed information about an item.
### Aliases: repo_info

### ** Examples

rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)
rp$put(1, "item1", "Sample item 1", "info")
rp$info("item1")

## wiping temporary repo
unlink(rp_path, TRUE)



