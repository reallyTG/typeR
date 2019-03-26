library(repo)


### Name: repo_entries
### Title: Low-level list of item entries.
### Aliases: repo_entries

### ** Examples

rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)
rp$put(1, "item1", "Sample item 1", "entries")
rp$put(2, "item2", "Sample item 2", "entries")
rp$put(3, "item3", "Sample item 3", "entries")
print(rp$entries())

## wiping temporary repo
unlink(rp_path, TRUE)



