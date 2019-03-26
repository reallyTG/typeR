library(pterrace)


### Name: muscle_fiber_dat
### Title: Point cloud sampled from the muscle tissue cross-sectional image
### Aliases: muscle_fiber_dat
### Keywords: datasets

### ** Examples

# load muscle fiber data
data(muscle_fiber_dat)

# input variables
Xlim <- c(-50,350)
Ylim <- c(-50,250)
lim <- cbind(Xlim, Ylim)
by <- 6
spseq <- seq(2,40,length.out = 9)

# compute persistence terrace
muscle_fiber_pt=computept(muscle_fiber_dat,sp=spseq,lim=lim,by=by)

## Not run: 
##D # compute persistence terrace with parallel option
##D spseq <- seq(2,40,length.out = 30)
##D two_circle_density_pt <- computept(muscle_fiber_dat,sp=spseq,lim=lim,by=by,par=TRUE)
## End(Not run)

# draw terrace area plot
terracearea(muscle_fiber_pt,dimension=1,maxheight=20)
# draw persistence terrace
plotpt(muscle_fiber_pt,cmax=12,dimension=1)



