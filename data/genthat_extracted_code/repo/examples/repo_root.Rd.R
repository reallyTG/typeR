library(repo)


### Name: repo_root
### Title: Show path to repo root
### Aliases: repo_root

### ** Examples

rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)
print(rp$root())

## wiping temporary repo
unlink(rp_path, TRUE)



