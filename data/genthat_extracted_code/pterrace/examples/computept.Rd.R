library(pterrace)


### Name: computept
### Title: Computes a persistence terrace of point cloud data.
### Aliases: computept

### ** Examples

# load three circle data
data(three_circle_dat)

# input variables
Xlim <- c(-4,12)
Ylim <- c(-4,9)
lim <- cbind(Xlim, Ylim)
by <- 0.2
spseq <- seq(0.01,1.5,length.out = 10)

# compute persistence terrace
threecirclept <- computept(three_circle_dat,sp=spseq,lim=lim,by=by)

## Not run: 
##D # compute persistence terrace with parallel option
##D spseq <- seq(0.01,1.5,length.out = 30)
##D threecirclept <- computept(three_circle_dat,sp=spseq,lim=lim,by=by,par=TRUE)
## End(Not run)



