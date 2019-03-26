library(repo)


### Name: repo_open
### Title: Open an existing repository or create a new one.
### Aliases: repo_open

### ** Examples

## Creates a new repository in a temporary directory without asking for
## confirmation.
rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)
rp$put(0, "zero", "a random item", "a_tag")
rp$info()
## wiping temporary repo
unlink(rp_path, TRUE)



