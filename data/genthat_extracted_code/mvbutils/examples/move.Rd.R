library(mvbutils)


### Name: move
### Title: Organizing R workspaces
### Aliases: move
### Keywords: utilities

### ** Examples

## Not run: 
##D move( myobj, ., 0) # back to the ROOT task
##D move( what="%myop%", 0/first.task, 0/second.task)
##D # neither source nor destination attached. Funny name requires "what"
##D move( what=c( "first.obj", "second.obj"), ., ../sibling.task)
##D # multiple objects require "what"
##D move( myobj, ..myfirstpack, ..mysecondpack) # live-edited packages
## End(Not run)



