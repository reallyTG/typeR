library(repo)


### Name: repo_pull
### Title: Download item remote content
### Aliases: repo_pull

### ** Examples

## Repository creation
rp_path <- file.path(tempdir(), "example_repo")
rp <- repo_open(rp_path, TRUE)
remote_URL <- paste0("https://github.com/franapoli/repo/blob/",
                     "untested/inst/remote_sample.RDS?raw=true")

## The following item will have remote source
rp$put("Local content", "item1", "Sample item 1", "tag",
         URL = remote_URL)
print(rp$get("item1"))

## suppressWarnings(try(rp$pull("item1"), TRUE))
 tryCatch(rp$pull("item1"),
         error = function(e)
             message("There were warnings whle accessing remote content"),
         warning = function(w)
             message("Could not download remote content")
         )
print(rp$get("item1"))

## wiping temporary repo
unlink(rp_path, TRUE)



