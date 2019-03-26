library(fgui)


### Name: gui
### Title: fgui Main Function
### Aliases: gui guiv guiNestedF guiExec guiFormals mgui fguiNewMenu
###   fguiWindow fguiWindowPrint
### Keywords: interface

### ** Examples


## Not run: 
##D ##################################################
##D ## *** EXAMPLE 1 ***                            ##
##D ## Basic example of available graphical objects ##
##D 
##D ## our function to base the GUI on
##D demofunc <- function( opt, lst, slide, cmd, ed, txt, flname ) {
##D   ## Returns a string of output, this will be displayed
##D   return( paste( "opt:",    opt,
##D                  "lst:",    paste(lst,collapse=","),
##D                  "slide:",  slide,
##D                  "ed:",     ed,
##D                  "txt:",    txt,
##D                  "flname:", flname,
##D                  sep="\n" ) )
##D }
##D ## Simple callback example
##D cmdCallback <- function() {
##D   tkmessageBox( message="Hello World :)", title="A Classic" )
##D }
##D ## start the gui
##D res <- gui( demofunc,
##D             argOption=list(opt=c("TRUE","FALSE")), ## names in list are that of args in func
##D             argList=list(lst=c(as.character(1:10))),
##D             argSlider=list(slide=c(0,100,2.5)),   ## start,stop,stepsize
##D             argCommand=list(cmd=cmdCallback),
##D             argEdit=list(ed=NULL), ## otherwise (width,height) to tweak, default
##D             argFilter=list(flname="{{Text files} {.txt}}") )  ## note space inbetween the braces!
##D ## prints out the arguments the user chose
##D print( res )
## End(Not run)

## Not run: 
##D ########################
##D ## ** EXAMPLE 2 ***   ##
##D ## Auto-loading help! ##
##D ## This is extremely useful if you write your own R package
##D ##  and want to include help with the GUI with no fuss.
##D 
##D ## This is what this looks like
##D help("rnorm")
##D ## Now build a gui
##D gui( rnorm )
##D 
##D ## Now, suppose we wanted to customize it,
##D ##  but we really want to keep all that help...
##D rnorm2 <- function( n=10, mean=1, sd=2 ) {
##D   res <- rnorm( n=n, mean=mean, sd=sd )
##D   return( paste( res, collapse=", " ) )
##D }
##D gui( rnorm2, helpsFunc="rnorm" )
## End(Not run)

## Not run: 
##D ######################
##D ## ** EXAMPLE 3 *** ##
##D ## Power interface  ##
##D 
##D ss <- function( alpha=0.05, beta=0.8, sigma=2, effect_size=0.5 ) {
##D   n <- ceiling(  (qnorm(1-alpha/2) + qnorm(1-beta))^2 * sigma^2 / effect_size^2  )
##D   print(n)
##D   return(n)
##D }
##D ## Create the gui
##D ## Note 1: the use of output in the slider
##D ## Note 2: callback set to the 'guiExec' (fixed) routine,
##D ##          so 'ss' is run with the proper arguments
##D ##          whenever a slider value is changed
##D gui( ss,
##D      argSlider=list(alpha=c(0,0.1,0.001),
##D                     beta=c(0,1,0.01),
##D                     sigma=c(0,10),
##D                     effect_size=c(0,10),
##D                     output=c(0,10000,1)), ## Note the use of output here
##D      exec=NULL, ## don't draw an execute button
##D      callback=guiExec
##D     )
## End(Not run)

## Not run: 
##D #################################
##D ## *** Example 4 ***           ##
##D ## Sliders setting each other. ##
##D ## You can envision this for more complicated power interfaces
##D ##  that do both calculating power and solving for sample
##D ##  sizes...
##D ## Also includes non-auto help, a waste to bother with
##D ##  if you are planning on creating a package
##D 
##D ## Change a default for fun, see `guiSet' function
##D ##  for more details/options
##D guiSet( "SLIDER_LENGTH", 400 )
##D 
##D 
##D sli <- function( alpha=0.5, beta=0.5 ) {
##D   ## Nothing to do...
##D }
##D sliCallback <- function( lastTouched ) {
##D   if( lastTouched=="alpha" )
##D     guiSetValue("beta",guiGetValue("alpha"))  ## setting beta to be alpha
##D   if( lastTouched=="beta" )
##D     guiSetValue("alpha",guiGetValue("beta"))  ## setting alpha to be beta
##D }
##D gui( sli,
##D      argSlider=list(alpha=c(0,1), beta=c(0,1)),
##D      output=NULL, exec=NULL, callback=sliCallback,
##D      helps=list(alpha="type I error", beta="power") )
## End(Not run)

## Not run: 
##D ###############################
##D ## *** EXAMPLE 5 ***         ##
##D ## Parsing R objects example ##
##D ## Suppose you want a user to be able to enter a vector of data,
##D ##  then you can use the following as an example for that.
##D summaryStats <- function( data ) {
##D   return( paste( "Mean = ", mean(data), ", Variance = ", var(data), sep="" ) )
##D }
##D 
##D gui(summaryStats, helps=list(
##D   data="Enter vector, e.g. 'c(13,66,44,27)' or 'rivers' for builtin dataset (without quotes)."))
## End(Not run)

## Not run: 
##D ###############################
##D ## *** EXAMPLE 6 ***         ##
##D ## Advanced nesting example. ##
##D ## Suppose we have a function 'f', which has too many
##D ##  arguments to comfortably fit on one screen.
##D f <- function( a=1, b=2, c=3, d=4, e=5, f=6 ) {
##D   print( "Running f" )
##D   return( paste( "a =", a, "\n",
##D                  "b =", b, "\n",
##D                  "c =", c, "\n",
##D                  "d =", d, "\n",
##D                  "e =", e, "\n",
##D                  "f =", f, "\n", sep="" ) )
##D }
##D ## Say we split into two functions/forms
##D f1 <- function( a=1, b=2, c=3 ) {
##D   print( "Running f1" )
##D   return( list(a=a,b=b,c=c) )
##D }
##D f2 <- function( d=4, e=5, f=6 ) {
##D   print( "Running f2" )
##D   return( list(d=d,e=e,f=f) )
##D }
##D ## Then our main gui function could be
##D guif <- function( abc, def ) {
##D   print( "guif" )
##D 
##D   print( "guif: abc" )
##D   print( abc )
##D   print( "guif: def" )
##D   print( def )
##D 
##D   f <- guiFormals( f, c(abc,def) )
##D   f()
##D }
##D gui( guif, argCommand=list(abc=guiNestedF(f1,"abc"), def=guiNestedF(f2,"def")) )
## End(Not run)

###############################
## *** EXAMPLE 7 ***         ##
## The menuing interface.    ##
## Call just as you would gui, same options, same everything,
##  EXCEPT title is now a vector indicating the menu path.
## If you want it modal though, do not do so until the last mgui call, 
##  or it will be modal inbetween additions to the menu!
## Not run: 
##D fguiWindowPrint( "Goes to the console because no window has been created." )
##D mgui( rgeom, title=c("Random","Geometric") )
##D mgui( rbinom, title=c("Random","Binomial") )
##D fguiNewMenu( c("Random","SEPARATOR") ) ## Puts a separator in the menu
##D mgui( rnorm, title=c("Random","Normal") )
##D mgui( runif, title=c("Random","Uniform") )
##D fguiWindowPrint( "Goes to the main window, now that it has been created." )
## End(Not run)

###############################
## *** EXAMPLE 8 ***         ##
## Basic lm() interface.     ##
## Not run: 
##D lmgui <- function( csvFilename, response, explanatory ) {
##D   ## Construct a formula for the 'lm' routine
##D   modelStr <- paste( response, "~", paste( explanatory, collapse="+" ) )
##D   ## Load in the data
##D   data <- read.csv( csvFilename )
##D   ## perform the regression, give the summary
##D   return <- summary(  lm( formula=modelStr, data=data )  )
##D }
##D 
##D lmguiCallback <- function( arg ) {
##D   if( arg=="csvFilename" ) {
##D     ## A dataset was chosen
##D     ## - The filename corresponds to the value at that argument
##D     ## - So pull of the names of that dataset
##D     datanames <- names( read.csv( guiGetValue("csvFilename") ) )
##D     print( datanames )
##D     ## - Store the datanames for future use, think of this as a global variable
##D     guiSet( "datanames", datanames )
##D     ## - Set the possible values for the response
##D     setListElements( "response", datanames )
##D     setListElements( "explanatory", datanames )
##D   }
##D }
##D 
##D guiv(lmgui, argFilename=list(csvFilename=NULL), 
##D   argList=list(response=NULL,explanatory=NULL), callback=lmguiCallback)
## End(Not run)
###############################
## *** EXAMPLE 9 ***         ##
## Advanced lm() interface.  ##
## Not run: 
##D ## The function we will pass to guiv is somewhat of a shell here, that is it would not
##D ##  make sense to use it from the command line. It's specification
##D ##  is only to create a GUI using fgui.
##D lmgui2 <- function( csvFilename,   ## Create file dialogue, special callback
##D                     simData,       ## Only for a command button
##D                     response,      ## Required input
##D                     explanatory,   ## Required input
##D                     scatter,       ## Only for a command button
##D                     summary ) {    ## Only for a command button
##D   ## Data has been loaded in callback routine,
##D   ##  into what can be thought of as a global variable
##D   data <- guiGetSafe("PERSONAL_dataset")
##D   if( class(data)[1] != "data.frame" )
##D     stop("Data must be loaded.") ## Gives error message box
##D 
##D   ## Error check: response and explanatory should have been set
##D   if( length(response)==0 ) stop( "Must specify a response." )
##D   if( length(explanatory)==0 ) stop( "Explanatory variable expected." )
##D 
##D   ## Run and return the fit from 'lm' linear model
##D   modelStr <- paste( response, "~", paste( explanatory, collapse="+" ) )
##D   return( lm( formula=modelStr, data=data ) )
##D }
##D lmgui2Callback <- function( arg ) {
##D   if( arg=="csvFilename" ) {
##D     ## Dataset chosen from file dialogue,
##D     ##  so we should load it in.
##D     data <- read.csv( guiGetValue("csvFilename") )
##D     guiSet( "PERSONAL_dataset", data ) ## think of as a global variable
##D     ## Also set possible values for response and explanatory variables
##D     setListElements( "response", names(data) )
##D     setListElements( "explanatory", names(data) )
##D   }else if( arg=="simData" ) {
##D     ## Generate a random set of data, and write to disk
##D     set.seed(13); library(MASS);
##D     data <- data.frame( mvrnorm( n=100, mu=c(0,0,0), 
##D       Sigma=matrix(c(1,0.3,0, 0.3,1,0.3, 0,0.3,1),nrow=3) ) )
##D     names( data ) <- c("Response","Covariate1","Covariate2")
##D     write.csv( data, "lmgui2_generated.csv", row.names=FALSE )
##D     ## Now set it as if it was loaded in, and run that callback
##D     guiSetValue( "csvFilename", "lmgui2_generated.csv" )
##D     lmgui2Callback( "csvFilename" )
##D   }else if( arg=="scatter" ) {
##D     ## Create a scatterplot of everything in the dataset
##D     data <- guiGetSafe("PERSONAL_dataset")
##D     response <- guiGetValue("response")
##D     wh.response <- which(names(data)==response)
##D     if( length(wh.response) != 1 )
##D       stop( "One and only one response must be chosen." )
##D     if( class(data)[1] != "data.frame" )
##D       stop( "Data must be loaded." )
##D     par( mfrow=rep( ceiling(sqrt(ncol(data)-1)), 2 ) )
##D     for( i in setdiff(1:ncol(data),wh.response) )
##D       plot( data[[i]], data[[wh.response]],
##D             xlab=names(data)[i], ylab=names(data)[wh.response] )
##D   }else if( arg=="summary" ) {
##D     print( summary( guiExec() ) ) ## when no output, guiExec returns value
##D   }
##D }
##D fit <- guiv( lmgui2,
##D               argFilename=list(csvFilename=NULL),
##D               argList=list(response=NULL,explanatory=NULL),
##D               argCommand=list(simData=NULL, scatter=NULL, summary=NULL),
##D               callback=lmgui2Callback,
##D               argGridOrder=c(1,1,2,2,3,3), ## Multi-column ordering
##D               argText=c(csvFilename="Load data (csv)",
##D                         simData="Simulate data",
##D                         response="Choose response variable",
##D                         explanatory="Choose explanatory variable",
##D                         scatter="Generate scatterplot to response variable",
##D                         summary="Print summary")
##D       )
## End(Not run)




