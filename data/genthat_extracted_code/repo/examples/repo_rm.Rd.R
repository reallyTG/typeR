library(repo)


### Name: repo_rm
### Title: Remove item from the repo (and the disk).
### Aliases: repo_rm

### ** Examples

rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)
rp$put(1, "item1", "Sample item 1", "info")
rp$put(2, "item2", "Sample item 2", "info")
print(rp)
rp$rm("item1")
print(rp)

## wiping temporary repo
unlink(rp_path, TRUE)



