library(repo)


### Name: repo_set
### Title: Edit an existing item.
### Aliases: repo_set

### ** Examples

rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)
rp$put(1, "item1", "Sample item 1", c("tag1", "tag2"))
rp$set("item1", obj=2)
print(rp$get("item1"))
rp$set("item1", description="Modified description", tags="new_tag_set")
rp$info("item1")

## wiping temporary repo
unlink(rp_path, TRUE)



