library(PBSmodelling)


### Name: doAction
### Title: Execute Action Created by a Widget
### Aliases: doAction
### Keywords: utilities character

### ** Examples

## Not run: 
##D local(envir=.PBSmodEnv,expr={
##D   createWin("button text=\"list objects\" func=doAction action=print(ls(all.names=TRUE))",
##D     astext=TRUE)
##D })
## End(Not run)



