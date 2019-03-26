library(pathological)


### Name: split_path
### Title: Split a path into directory components
### Aliases: split_path split_dir

### ** Examples

(splits <- split_path(c(getwd(), "~", r_home())))
# Reverse the operation
sapply(splits, paste, collapse = "/")

base_r_files <- split_dir(R.home(), pattern = "\\.R$")
## No test: 
  # Viewing not needed for testing purposes
  utils::View(base_r_files)
## End(No test)



