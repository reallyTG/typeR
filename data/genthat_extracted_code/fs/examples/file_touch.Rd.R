library(fs)


### Name: file_touch
### Title: Change file access and modification times
### Aliases: file_touch

### ** Examples

## Don't show: 
.old_wd <- setwd(tempdir())
## End(Don't show)
file_create("foo")
file_touch("foo", "2018-01-01")
file_info("foo")[c("access_time", "modification_time", "change_time", "birth_time")]
## Don't show: 
setwd(.old_wd)
## End(Don't show)



