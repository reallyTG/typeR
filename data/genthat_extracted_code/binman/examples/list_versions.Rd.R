library(binman)


### Name: list_versions
### Title: List app versions
### Aliases: list_versions

### ** Examples

## Not run: 
##D appdir <- app_dir("superduperapp", FALSE)
##D platforms <- LETTERS[1:4]
##D versions <- LETTERS[5:7]
##D mkdirs <- file.path(appdir, outer(platforms, versions, file.path))
##D chk <- vapply(mkdirs, dir.create, logical(1), recursive = TRUE)
##D expect_true(all(chk))
##D res <- list_versions("superduperapp")
##D unlink(appdir, recursive = TRUE)
## End(Not run)



