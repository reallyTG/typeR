library(repo)


### Name: repo_tags
### Title: List all tags
### Aliases: repo_tags

### ** Examples

rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)

## Putting two items with a few tags
rp$put(1, "item1", "Sample item 1",
    c("repo_tags", "tag1"))
rp$put(2, "item2", "Sample item 2",
    c("repo_tags", "tag2"))

## Looking up tags
rp$tags()

## wiping temporary repo
unlink(rp_path, TRUE)



