library(binman)


### Name: rm_platform
### Title: Remove application platform
### Aliases: rm_platform

### ** Examples

## Not run: 
##D appdir <- app_dir(appname, FALSE)
##D platforms <- LETTERS[1:4]
##D versions <- LETTERS[5:7]
##D mkdirs <- file.path(appdir, outer(platforms, versions, file.path))
##D chk <- vapply(mkdirs, dir.create, logical(1), recursive = TRUE)
##D appver <- list_versions(appname)
##D rm_platform(appname, platforms[2:3])
##D unlink(appdir, recursive = TRUE)
## End(Not run)



