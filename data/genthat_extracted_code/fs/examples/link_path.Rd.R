library(fs)


### Name: link_path
### Title: Read the value of a symbolic link
### Aliases: link_path

### ** Examples

## Don't show: 
.old_wd <- setwd(tempdir())
## End(Don't show)
file_create("foo")
link_create(path_abs("foo"), "bar")
link_path("bar")

# Cleanup
file_delete(c("foo", "bar"))
## Don't show: 
setwd(.old_wd)
## End(Don't show)



