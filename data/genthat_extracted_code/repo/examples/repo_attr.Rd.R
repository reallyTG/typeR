library(repo)


### Name: repo_attr
### Title: Get item attribute.
### Aliases: repo_attr

### ** Examples

rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)
rp$put(1, "item1", "Sample item 1", "tag1")
print(rp$attr("item1", "path"))

## wiping temporary repo
unlink(rp_path, TRUE)



