library(pterrace)


### Name: two_circle_size_dat
### Title: Point cloud of two circles of same point density but different
###   size
### Aliases: two_circle_size_dat
### Keywords: datasets

### ** Examples

# load data
data(two_circle_size_dat)

# input variables
Xlim <- c(-4,13)
Ylim <- c(-7,7)
lim <- cbind(Xlim, Ylim)
by <- 0.1
spseq <- seq(0.01,3,length.out = 25)

# compute persistence terrace with parallel option
## Not run: 
##D two_circle_size_pt <- computept(two_circle_size_dat,sp=spseq,lim=lim,by=by,par=TRUE)
##D 
##D # draw persistence terrace, satellite view
##D plotpt(two_circle_size_pt,dimension=1)
## End(Not run)



