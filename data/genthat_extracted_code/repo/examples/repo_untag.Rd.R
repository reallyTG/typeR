library(repo)


### Name: repo_untag
### Title: Remove tags from an item.
### Aliases: repo_untag

### ** Examples

rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)
rp$put(1, "item1", "Sample item 1", c("tag1", "tag2"))
rp$print(show="t")
rp$untag("item1", "tag2")
rp$print(show="t")

## wiping temporary repo
unlink(rp_path, TRUE)



