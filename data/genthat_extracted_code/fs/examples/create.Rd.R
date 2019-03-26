library(fs)


### Name: create
### Title: Create files, directories, or links
### Aliases: create file_create dir_create link_create

### ** Examples

## Don't show: 
.old_wd <- setwd(tempdir())
## End(Don't show)
file_create("foo")
is_file("foo")
# dir_create applied to the same path will fail
try(dir_create("foo"))

dir_create("bar")
is_dir("bar")
# file_create applied to the same path will fail
try(file_create("bar"))

# Cleanup
file_delete("foo")
dir_delete("bar")
## Don't show: 
setwd(.old_wd)
## End(Don't show)



