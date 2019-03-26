library(PBSmodelling)


### Name: initHistory
### Title: Create Structures for a New History Widget
### Aliases: initHistory rmHistory addHistory forwHistory backHistory
###   jumpHistory clearHistory clearHistory lastHistory firstHistory
### Keywords: utilities

### ** Examples

## Not run: 
##D # ****** THIS CODE DOES NOT RUN. NEEDS FIXING *****
##D # Example of creating a custom history widget that saves values 
##D # whenever the "Plot" button is pressed. The user can tweak the 
##D # inputs "a", "b", and "points" before each "Plot" and see the 
##D # "Index" increase. After sufficient archiving, the user can review 
##D # scenarios using the "Back" and "Next" buttons. 
##D # A custom history is needed to achieve this functionality since 
##D # the packages pre-defined history widget does not update plots.
##D 
##D # To start, create a Window Description to be used with createWin 
##D # using astext=TRUE. P.S. Watch out for special characters which 
##D # must be "escaped" twice (first for R, then PBSmodelling).
##D 
##D local(envir=.PBSmodEnv,expr={
##D   oldpar = par(no.readonly=TRUE)
##D 
##D winDesc <- '
##D   window title="Custom History"
##D   vector names="a b k" labels="a b points" font="bold" \\
##D   values="1 1 1000" function=myPlot
##D   grid 1 3
##D     button function=myHistoryBack text="<- Back"
##D     button function=myPlot text="Plot"
##D     button function=myHistoryForw text="Next ->"
##D   grid 2 2
##D     label "Index"
##D     entry name="myHistoryIndex" width=5
##D     label "Size"
##D     entry name="myHistorySize" width=5
##D '
##D # Convert text to vector with each line represented as a new element
##D winDesc <- strsplit(winDesc, "\n")[[1]]
##D 
##D # Custom functions to update plots after restoring history values
##D myHistoryBack <- function() {
##D   backHistory("myHistory");
##D   myPlot(saveVal=FALSE); # show the plot with saved values
##D }
##D myHistoryForw <- function() {
##D   forwHistory("myHistory");
##D   myPlot(saveVal=FALSE); # show the plot with saved values 
##D }
##D myPlot <- function(saveVal=TRUE) {
##D   # save all data whenever plot is called (directly)
##D   if (saveVal) addHistory("myHistory");
##D   getWinVal(scope="L");
##D   tt <- 2*pi*(0:k)/k;
##D   x <- (1+sin(a*tt));  y <- cos(tt)*(1+sin(b*tt));
##D   plot(x, y);
##D }
##D   iHistory("myHistory", "myHistoryIndex", "myHistorySize")
##D   createWin(winDesc, astext=TRUE)
##D   par(oldpar)
##D })
## End(Not run)



