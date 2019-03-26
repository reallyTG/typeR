library(PBSmodelling)


### Name: createWin
### Title: Create a GUI Window
### Aliases: createWin
### Keywords: utilities

### ** Examples

## Not run: 
##D # See file .../library/PBSmodelling/testWidgets/LissWin.txt
##D # Calculate and draw the Lissajous figure
##D local(envir=.PBSmodEnv,expr={
##D   drawLiss <- function() {
##D     oldpar = par(no.readonly=TRUE); on.exit(par(oldpar))
##D     getWinVal(scope="L"); ti=2*pi*(0:k)/k;
##D     x=sin(2*pi*m*ti);     y=sin(2*pi*(n*ti+phi));
##D     plot(x,y,type=ptype); invisible(NULL); };
##D   createWin(system.file("testWidgets/LissWin.txt",package="PBSmodelling"));
##D })
##D 
##D ############################################################
##D # Environment example:
##D # function in global
##D local(envir=.PBSmodEnv,expr={
##D   hello <- function() {
##D     stop( "I shouldn't be called" )
##D   }
##D 
##D newNameGreeter <- function( name ) {
##D   # method to display window
##D   greet <- function() {
##D     createWin(c("button \"Say hello\" func=hello"), astext=TRUE,
##D       env=parent.env(environment()))
##D   }
##D   # hello method will refer to the name in this local scope
##D   hello <- function() {
##D     cat( "Hello", name, "\n" )
##D   }
##D   # return functions which the user can call directly
##D   return( list( greet=greet, hello=hello ) )
##D }
##D alex <- newNameGreeter( "Alex" )
##D jon  <- newNameGreeter( "Jon" )
##D 
##D alex$hello() # prints hello Alex
##D jon$hello()  # prints hello Jon
##D alex$greet() # creates a GUI with a button, which will print "hello Alex" when pushed
##D })
## End(Not run)



