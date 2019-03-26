library(pterrace)


### Name: terracearea
### Title: Draws a terrace area plot for a persistence terrace.
### Aliases: terracearea
### Keywords: graphics

### ** Examples

## Not run: 
##D # load three circle data
##D data(three_circle_dat)
##D 
##D # input variables
##D Xlim <- c(-4,12)
##D Ylim <- c(-4,9)
##D lim <- cbind(Xlim, Ylim)
##D by <- 0.1
##D spseq <- seq(0.01,1.5,length.out = 25)
##D 
##D # compute persistence terrace
##D threecirclept <- computept(three_circle_dat,sp=spseq,lim=lim,by=by)
##D 
##D # draw terrace area plot
##D terracearea(threecirclept,dimension=1)
## End(Not run)



