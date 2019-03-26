library(PBSmodelling)


### Name: selectDir
### Title: Display Dialogue: Select directory
### Aliases: selectDir
### Keywords: file

### ** Examples

## Not run: 
##D local(envir=.PBSmodEnv,expr={
##D   dir(selectDir(title="select a directory to list contents of"))
##D 
##D   #integration with widget via doAction
##D   createWin( c( "entry foo mode=character", 
##D     "button text=\"select dir\" 
##D     func=doAction action=\"selectDir(usewidget=`foo`)\"" ), astext=TRUE )
##D })
## End(Not run)



