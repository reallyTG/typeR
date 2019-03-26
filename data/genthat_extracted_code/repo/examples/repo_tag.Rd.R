library(repo)


### Name: repo_tag
### Title: Add tags to an item.
### Aliases: repo_tag

### ** Examples

rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)
rp$put(1, "item1", "Sample item 1", "tag1")
rp$print(show="t")
rp$tag("item1", "tag2")
rp$print(show="t")

## wiping temporary repo
unlink(rp_path, TRUE)



