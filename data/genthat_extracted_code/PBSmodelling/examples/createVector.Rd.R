library(PBSmodelling)


### Name: createVector
### Title: Create a GUI with a Vector Widget
### Aliases: createVector
### Keywords: utilities

### ** Examples

## Not run: 
##D local(envir=.PBSmodEnv,expr={
##D #user defined function which is called on new data  
##D drawLiss <- function() {
##D   oldpar = par(no.readonly=TRUE); on.exit(par(oldpar))
##D   getWinVal(scope="L");
##D   tt <- 2*pi*(0:k)/k; x <- sin(2*pi*m*tt); y <- sin(2*pi*(n*tt+phi));
##D   plot(x,y,type="p"); invisible(NULL); };
##D 
##D #create the vector window
##D createVector(c(m=2, n=3, phi=0, k=1000), func="drawLiss",
##D   vectorLabels=c("x cycles","y cycles", "y phase", "points"));
##D })
## End(Not run)



