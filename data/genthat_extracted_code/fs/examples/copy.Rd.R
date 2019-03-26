library(fs)


### Name: copy
### Title: Copy files, directories or links
### Aliases: copy file_copy dir_copy link_copy

### ** Examples

## Don't show: 
.old_wd <- setwd(tempdir())
## End(Don't show)
file_create("foo")
file_copy("foo", "bar")
try(file_copy("foo", "bar"))
file_copy("foo", "bar", overwrite = TRUE)
file_delete(c("foo", "bar"))

dir_create("foo")
# Create a directory and put a few files in it
files <- file_create(c("foo/bar", "foo/baz"))
file_exists(files)

# Copy the directory
dir_copy("foo", "foo2")
file_exists(path("foo2", path_file(files)))

# Create a link to the directory
link_create(path_abs("foo"), "loo")
link_path("loo")
link_copy("loo", "loo2")
link_path("loo2")

# Cleanup
dir_delete(c("foo", "foo2"))
link_delete(c("loo", "loo2"))
## Don't show: 
setwd(.old_wd)
## End(Don't show)



