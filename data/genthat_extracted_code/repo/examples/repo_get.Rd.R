library(repo)


### Name: repo_get
### Title: Retrieve an item from the repo.
### Aliases: repo_get

### ** Examples

rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)
rp$put(1, "item1", "Sample item 1", "get")
print(rp$get("item1"))

## wiping temporary repo
unlink(rp_path, TRUE)



