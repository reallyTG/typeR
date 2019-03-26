library(repo)


### Name: repo_export
### Title: Export 'repo' items to RDS file.
### Aliases: repo_export

### ** Examples

rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)
rp$put(1, "item1", "Sample item 1", "export")
rp$export("item1", tempdir()) # creates item1.RDS in a tempdir

## wiping temporary repo
unlink(rp_path, TRUE)



