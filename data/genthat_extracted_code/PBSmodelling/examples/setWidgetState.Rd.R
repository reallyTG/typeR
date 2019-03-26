library(PBSmodelling)


### Name: setWidgetState
### Title: Update Widget State
### Aliases: setWidgetState
### Keywords: methods

### ** Examples

## Not run: 
##D local(envir=.PBSmodEnv,expr={
##D   winDesc <- c('vector length=3 name=vec labels="normal disabled readonly" values="1 2 3"',
##D              "matrix nrow=2 ncol=2 name=mat", "button name=but_name" );
##D   createWin(winDesc, astext=TRUE)
##D 
##D   setWidgetState( "vec[1]", "normal" )
##D   setWidgetState( "vec[2]", "disabled" )
##D   setWidgetState( "vec[3]", "readonly" )
##D 
##D   setWidgetState( "mat", "readonly" )
##D   setWinVal( list( mat = matrix( 1:4, 2, 2 ) ) )
##D 
##D   #works for buttons too
##D   setWidgetState( "but_name", "disabled" )
##D })
## End(Not run)



