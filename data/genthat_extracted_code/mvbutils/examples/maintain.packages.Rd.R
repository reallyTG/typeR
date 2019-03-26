library(mvbutils)


### Name: maintain.packages
### Title: Set up task package for live editing
### Aliases: maintain.packages unmaintain.package
### Keywords: misc

### ** Examples

## Not run: 
##D # In your .First:
##D library( mvbutils)
##D maintain.packages( myfirstpack, mysecondpack, mythirdpack)
##D # or...
##D live.edit.list <- c( 'myfirstpack', 'mysecondpack', 'mythirdpack')
##D maintain.packages( live.edit.list, character.only=TRUE)
##D library( myfirstpack) # etc
## End(Not run)



