library(repo)


### Name: repo_check
### Title: Check repository integrity.
### Aliases: repo_check

### ** Examples

## Repository creation
rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)

rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)
rp$put(0, "item1", "A sample item", "repo_check")
rp$check()

## wiping temporary repo
unlink(rp_path, TRUE)



