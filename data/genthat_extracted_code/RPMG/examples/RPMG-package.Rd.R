library(RPMG)


### Name: RPMG-package
### Title: Really Poor Man's GUI: sets up buttons for a graphical user
###   interface in R
### Aliases: RPMG-package RPMG
### Keywords: package

### ** Examples

###  get sample image data set.
data(volcano)
#####   set sample interval unit
attr(volcano, 'dx') =10
attr(volcano, 'dy') =10
###  create the list of labels
###  Actions for these buttons are described in the calling program XSECDEM
mybutts = c("DONE", "REFRESH", "rainbow", "topo", "terrain", "CONT", "XSEC","PS" )
XSECDEM(volcano, mybutts)
############################################# 
#############################################  CODE STUB
## Not run: 
##D ###   Example code chunk:
##D ###  general set up of RPGM usage:
##D ######  make a plot
##D #######  set buttons
##D buttons = rowBUTTONS(c("BUT1","BUT2") , col=c(1,1), pch=c(1,1))
##D #######  after plotting, locate in plot....
##D zloc = locator()
##D Nclick = length(zloc$x)
##D #############  the last click on the screen before stopping (middle
##D #############        mouse click) is used to set the action
##D K =  whichbutt(zloc , buttons)
##D while(TRUE)
##D       {
##D 	if(K[Nclick] == match("BUT1", labs, nomatch = NOLAB))
##D           {
##D             ###  do what ever button 1 is supposed to do
##D           }
##D 	if(K[Nclick] == match("BUT2", labs, nomatch = NOLAB))
##D           {
##D             ###  do what ever button 2 is supposed to do
##D           }
##D 	}  ## end while loop
## End(Not run)






