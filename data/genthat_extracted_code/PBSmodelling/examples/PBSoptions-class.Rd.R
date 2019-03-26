library(PBSmodelling)


### Name: PBSoptions-class
### Title: S4: Project Options Class
### Aliases: PBSoptions-class print,PBSoptions-method
###   show,PBSoptions-method
### Keywords: classes methods

### ** Examples

## Not run: 
##D local(envir=.PBSmodEnv,expr={
##D   #initialize an option manager with a single logical option
##D   .mypkg <- new( "PBSoptions", filename="my_pkg.txt", 
##D     initial.options=list( sillyhatday=FALSE ) )
##D 
##D   #retrieving an option
##D   silly <- getOptions( .mypkg, "sillyhatday" )
##D   cat( "today is", ifelse( silly, "silly hat day!", "monday" ), "\n" )
##D 
##D   #set an option
##D   setOptions( .mypkg, sillyhatday = TRUE, photos = "/shares/silly_hat_photos" )
##D 
##D   #create a GUI which works with options
##D   createWin( c( 
##D     "check name=optionsillyhatday text=\"silly hat day\"",
##D     "entry name=optionphotos width=22 mode=character label=\"photos directory\"",
##D     "button func=doAction text=save action=saveOptionsGUI(.mypkg)" ), astext = TRUE )
##D 
##D   #update GUI values based on values stored in .mypkg's options
##D   loadOptionsGUI( .mypkg )
##D   print(getOptions( .mypkg ))
##D })
## End(Not run)



