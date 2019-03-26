library(pterrace)


### Name: plotpt
### Title: Draws a persistence terrace.
### Aliases: plotpt
### Keywords: graphics

### ** Examples

# load three circle data
data(three_circle_dat)

# input variables
Xlim <- c(-4,12)
Ylim <- c(-4,9)
lim <- cbind(Xlim, Ylim)
by <- 0.1
spseq <- seq(0.01,1.5,length.out = 25)

# compute persistence terrace
## Not run: 
##D threecirclept <- computept(three_circle_dat,sp=spseq,lim=lim,by=by)
##D 
##D # draw persistence terrace, satellite view
##D plotpt(threecirclept,dimension=1)
##D # draw persistence terrace, overall view
##D plotpt(threecirclept,dimension=1,satellite=FALSE)
## End(Not run)



