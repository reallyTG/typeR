library(repo)


### Name: repo_find
### Title: Match items by matching any field
### Aliases: repo_find

### ** Examples

rp_path <- file.path(tempdir(), "example_repo")

rp <- repo_open(rp_path, TRUE)
rp$put(1, "item1", "Sample item 1", c("tag1", "tag2"))
rp$put(2, "item2", "Sample item 2", c("tag1", "hide"))
rp$put(3, "item3", "Sample item 3", c("tag2", "tag3"))
rp$print()
rp$find("tEm2")
rp$find("ag2", show="t")

## wiping the temp repo
unlink(rp_path, TRUE)




