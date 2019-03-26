library(repo)


### Name: repo_copy
### Title: Copy items to another repository
### Aliases: repo_copy

### ** Examples

## Repository creation
rp_path1 <- file.path(tempdir(), "example_repo1")

rp1 <- repo_open(rp_path1, TRUE)
rp1$put(0, "item1", "A sample item", "tag1")
rp_path2 <- file.path(tempdir(), "example_repo2")
rp2 <- repo_open(rp_path2, TRUE)
rp1$copy(rp2, "item1")

## wiping temporary repo
unlink(rp_path1, TRUE)
unlink(rp_path2, TRUE)



