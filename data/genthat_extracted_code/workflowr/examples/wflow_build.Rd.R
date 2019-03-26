library(workflowr)


### Name: wflow_build
### Title: Build the site
### Aliases: wflow_build

### ** Examples

## Not run: 
##D 
##D # Build any files which have modified
##D wflow_build() # equivalent to wflow_build(make = TRUE)
##D # Build a single file
##D wflow_build("file.Rmd")
##D # Build multiple files
##D wflow_build(c("file1.Rmd", "file2.Rmd"))
##D # Build multiple files using a file glob
##D wflow_build("file*.Rmd")
##D # Build every published file
##D wflow_build(republish = TRUE)
##D # Build file.Rmd and any files which have been modified
##D wflow_build("file.Rmd", make = TRUE)
## End(Not run)




