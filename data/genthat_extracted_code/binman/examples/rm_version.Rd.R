library(binman)


### Name: rm_version
### Title: Remove application version
### Aliases: rm_version

### ** Examples

## Not run: 
##D appdir <- app_dir(appname, FALSE)
##D platforms <- LETTERS[1:4]
##D versions <- LETTERS[5:7]
##D mkdirs <- file.path(appdir, outer(platforms, versions, file.path))
##D chk <- vapply(mkdirs, dir.create, logical(1), recursive = TRUE)
##D appver <- list_versions(appname)
##D rm_version(appname, platforms[2], versions[1:2])
##D unlink(appdir, recursive = TRUE)
## End(Not run)



