library(PBSmodelling)


### Name: selectFile
### Title: Display Dialogue: Open or Save File
### Aliases: selectFile
### Keywords: file

### ** Examples

## Not run: 
##D local(envir=.PBSmodEnv,expr={
##D   #integration with widget via doAction
##D   createWin( c( "entry foo mode=character width=60", 
##D     "button text=\"select file\" 
##D     func=doAction action=\"selectFile(usewidget=`foo`)\"" ), astext=TRUE )
##D })
## End(Not run)



