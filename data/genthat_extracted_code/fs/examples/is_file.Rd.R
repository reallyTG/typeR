library(fs)


### Name: is_file
### Title: Functions to test for file types
### Aliases: is_file is_dir is_link

### ** Examples

## Don't show: 
.old_wd <- setwd(tempdir())
## End(Don't show)
dir_create("d")

file_create("d/file.txt")
dir_create("d/dir")
link_create(path(path_abs("d"), "file.txt"), "d/link")

paths <- dir_ls("d")
is_file(paths)
is_dir(paths)
is_link(paths)

# Cleanup
dir_delete("d")
## Don't show: 
setwd(.old_wd)
## End(Don't show)



