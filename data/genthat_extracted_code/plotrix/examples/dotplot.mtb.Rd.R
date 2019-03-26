library(plotrix)


### Name: dotplot.mtb
### Title: Minitab style dotplots.
### Aliases: dotplot.mtb
### Keywords: hplot

### ** Examples

## Not run: 
##D set.seed(42)
##D x <- rpois(100,10)
##D dotplot.mtb(x,main="No y-axis.")
##D dotplot.mtb(x,yaxis=TRUE,main="With y-axis displayed.")
##D dotplot.mtb(x,hist=TRUE,main="An \"h\" style plot.")
##D dotplot.mtb(x,xlim=c(4,16),main="With the x-axis limited.")
##D dotplot.mtb(x,yaxis=TRUE,mtbstyle=FALSE,main="Non-Minitab style.")
##D dotplot.mtb(x,yaxis=TRUE,xlab="x",ylab="count",
##D             main="With x and y axis labels.")
## End(Not run)



