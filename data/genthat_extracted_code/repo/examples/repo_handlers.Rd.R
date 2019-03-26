library(repo)


### Name: repo_handlers
### Title: Provides simplified access to repository items.
### Aliases: repo_handlers

### ** Examples


## Repository creation
rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)

## Putting some irrelevant data
rp$put(1, "item1", "Sample item 1", "repo_handlers")
rp$put(2, "item2", "Sample item 2", "repo_handlers")

## Getting item handlers
h <- rp$handlers()
## handlers have the same names as the items in the repo (and they
## include an handler to the repo itself).
names(h)

## Without arguments, function "item1" loads item named "item1".
i1 <- h$item1()

## Arguments can be used to call other repo functions on the item.
h$item1("info")

## After putting new data, the handlers must be refreshed.
rp$put(3, "item3", "Sample item 3", "repo_handlers")
h <- rp$handlers()
names(h)

## wiping temporary repo
unlink(rp_path, TRUE)



