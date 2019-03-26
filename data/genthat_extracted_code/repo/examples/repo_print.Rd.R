library(repo)


### Name: repo_print
### Title: Show a summary of the repository contents.
### Aliases: repo_print

### ** Examples

rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)
rp$put(1, "item1", "Sample item 1", c("tag1", "tag2"))
rp$put(2, "item2", "Sample item 2", c("tag1", "hide"))
rp$put(3, "item3", "Sample item 3", c("tag2", "tag3"))
rp$print()
rp$print(all=TRUE)
rp$print(show="tds", all=TRUE)
rp$print(show="tds", all=TRUE, tags="tag1")
## wiping the temp repo
unlink(rp_path, TRUE)

## wiping temporary repo
unlink(rp_path, TRUE)



