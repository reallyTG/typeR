library(MESS)


### Name: wallyplot.default
### Title: Plots a Wally plot
### Aliases: wallyplot.default wallyplot.lm wallyplot
### Keywords: iplot

### ** Examples


## Not run: 
##D data(trees)
##D res <- lm(Volume ~ Height + Girth, data=trees)
##D wallyplot(res)
##D 
##D 
##D # Create a grid of QQ-plot figures
##D # Define function to plot a qq plot with an identity line
##D qqnorm.wally <- function(x, y, ...) { qqnorm(y, ...) ; abline(a=0, b=1) }
##D wallyplot(res, FUN=qqnorm.wally, main="")
##D 
##D # Define function to simulate components+residuals for Girth
##D cprsimulate <- function(n) {rnorm(n)+trees$Girth}
##D # Create the cpr plotting function
##D cprplot <- function(x, y, ...) {plot(x, y, pch=20, ...) ;
##D                                  lines(lowess(x, y), lty=3)}
##D # Create the Wallyplot
##D wallyplot(trees$Girth, trees$Girth+rstudent(res), FUN=cprplot,
##D           simulateFunction=cprsimulate, xlab="Girth")
## End(Not run)




