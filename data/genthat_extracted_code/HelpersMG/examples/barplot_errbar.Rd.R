library(HelpersMG)


### Name: barplot_errbar
### Title: Plot a barplot graph with error bar on y
### Aliases: barplot_errbar

### ** Examples

## Not run: 
##D barplot_errbar(rnorm(10, 10, 3), 
##D 	xlab="axe x", ylab="axe y", bty="n", 
##D 		errbar.y.plus=rnorm(10, 1, 0.1), col=rainbow(10), 
##D 		names.arg=paste("Group",1:10), cex.names=0.6)
##D y <- rnorm(10, 10, 3)
##D barplot_errbar(y, 
##D                	xlab="axe x", ylab="axe y", bty="n", 
##D             		y.plus=y+2)
## End(Not run)



