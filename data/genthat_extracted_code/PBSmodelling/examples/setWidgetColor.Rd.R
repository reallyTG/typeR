library(PBSmodelling)


### Name: setWidgetColor
### Title: Update Widget Color
### Aliases: setWidgetColor
### Keywords: methods

### ** Examples

## Not run: 
##D local(envir=.PBSmodEnv,expr={
##D   createWin("label \"hello world\" name=hello", astext=TRUE)
##D   setWidgetColor( "hello", bg="lightgreen", fg="purple" )
##D })
##D local(envir=.PBSmodEnv,expr={
##D   createWin("vector names=v length=3 values=\"1 2 3\"", astext=TRUE)
##D   setWidgetColor( "v[1]", entrybg="lightgreen", entryfg="purple" )
##D   setWidgetColor( "v[2]", entrybg="green", entryfg="purple" )
##D   setWidgetColor( "v[3]", entrybg="forestgreen", entryfg="purple" )
##D })
## End(Not run)



