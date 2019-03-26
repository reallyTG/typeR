library(fs)


### Name: file_chmod
### Title: Change file permissions
### Aliases: file_chmod

### ** Examples

## Don't show: 
.old_wd <- setwd(tempdir())
## End(Don't show)
file_create("foo", mode = "000")
file_chmod("foo", "777")
file_info("foo")$permissions

file_chmod("foo", "u-x")
file_info("foo")$permissions

file_chmod("foo", "a-wrx")
file_info("foo")$permissions

file_chmod("foo", "u+wr")
file_info("foo")$permissions

# It is also vectorized
files <- c("foo", file_create("bar", mode = "000"))
file_chmod(files, "a+rwx")
file_info(files)$permissions

file_chmod(files, c("644", "600"))
file_info(files)$permissions
## Don't show: 
setwd(.old_wd)
## End(Don't show)



