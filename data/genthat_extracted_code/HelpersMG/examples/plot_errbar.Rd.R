library(HelpersMG)


### Name: plot_errbar
### Title: Plot a xy graph with error bar on x and/or y
### Aliases: plot_errbar

### ** Examples

## Not run: 
##D plot_errbar(1:100, rnorm(100, 1, 2), 
##D 	xlab="axe x", ylab="axe y", bty="n", xlim=c(1,100), 
##D 		errbar.x=2, errbar.y=rnorm(100, 1, 0.1))
##D x <- 1:100
##D plot_errbar(x=1:100, rnorm(100, 1, 2), 
##D                	xlab="axe x", ylab="axe y", bty="n", xlim=c(1,100), 
##D             		x.minus=x-2, x.plus=x+2)
##D x <- 1:100
##D plot_errbar(x=1:100, rnorm(100, 1, 2), 
##D                	xlab="axe x", ylab="axe y", bty="n", 
##D                	pch=21, bg="white", 
##D             		x.minus=x-10, x.plus=x+10)
##D x <- (1:200)/10
##D y <- sin(x)
##D plot_errbar(x=x, y=y, xlab="axe x", ylab="axe y", bty="n", xlim=c(1,20), 
##D      y.minus=y-1, y.plus=y+1, ylim=c(-3, 3), type="l",  
##D 		errbar.y.polygon=TRUE, 
##D 		errbar.y.polygon.list=list(border=NA, col=rgb(0, 0, 0, 0.5)))
##D 		
## End(Not run)



