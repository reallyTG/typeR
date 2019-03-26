library(pterrace)


### Name: two_circle_density_dat
### Title: Point cloud of two circles of same size but different point
###   density
### Aliases: two_circle_density_dat
### Keywords: datasets

### ** Examples

# load data
data(two_circle_density_dat)

# input variables
Xlim <- c(-3,6)
Ylim <- c(-3,3)
lim <- cbind(Xlim, Ylim)
by <- 0.1
spseq <- seq(0.01,1,length.out=20)

# compute persistence terrace
two_circle_density_pt <- computept(two_circle_density_dat,sp=spseq,lim=lim,by=by)

## Not run: 
##D # compute persistence terrace with parallel option
##D two_circle_density_pt <- computept(two_circle_density_dat,sp=spseq,lim=lim,by=by,par=TRUE)
## End(Not run)

# draw persistence terrace, satellite view
plotpt(two_circle_density_pt,dimension=1)



