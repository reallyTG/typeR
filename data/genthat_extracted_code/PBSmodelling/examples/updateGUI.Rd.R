library(PBSmodelling)


### Name: updateGUI
### Title: Update Active GUI With Local Values
### Aliases: updateGUI
### Keywords: methods

### ** Examples

## Not run: 
##D local(envir=.PBSmodEnv,expr={
##D   #law of free food: http://www.phdcomics.com/comics.php?f=1223
##D   createWin( c( 
##D     "vector names=\"foodquality hunger cost\" values=\"0.6 0.8 0.1\" width=10",
##D     "entry name=taste edit=F label=taste:" ), astext=TRUE )
##D   getWinVal( scope="P" )
##D   taste <- foodquality * hunger / cost
##D   updateGUI()
##D })
## End(Not run)



