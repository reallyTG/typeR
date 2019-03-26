library(PBSmodelling)


### Name: getOptionsPrefix
### Title: Get and Set GUI Prefix of Options Class
### Aliases: getOptionsPrefix setOptionsPrefix
### Keywords: methods

### ** Examples

## Not run: 
##D local(envir=.PBSmodEnv,expr={
##D   # For the example, the options object is saved to the temporary environment;
##D   # however, a user would normally create the object in his/her workspace.
##D   .mypkg <- new( "PBSoptions", filename="my_pkg.txt", 
##D     initial.options=list(pi=3.14), gui.prefix="opt" )
##D 
##D   #prefix the option "pi" with "opt" to get "optpi"
##D   createWin( "entry name=optpi", astext = TRUE )
##D 
##D   #the GUI variable "optpi" will be loaded with the option "pi"
##D   loadOptionsGUI( .mypkg )
##D })
## End(Not run)



