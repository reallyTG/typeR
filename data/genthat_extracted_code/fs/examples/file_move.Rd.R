library(fs)


### Name: file_move
### Title: Move or rename files
### Aliases: file_move

### ** Examples

## Don't show: 
.old_wd <- setwd(tempdir())
## End(Don't show)
file_create("foo")
file_move("foo", "bar")
file_exists(c("foo", "bar"))
file_delete("bar")
## Don't show: 
setwd(.old_wd)
## End(Don't show)



