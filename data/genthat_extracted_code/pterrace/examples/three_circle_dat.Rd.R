library(pterrace)


### Name: three_circle_dat
### Title: Point cloud of three circles of different size and point density
### Aliases: three_circle_dat
### Keywords: datasets

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
three_circle_pt <- computept(three_circle_dat,sp=spseq,lim=lim,by=by)

## Not run: 
##D # compute persistence terrace with parallel option
##D spseq <- seq(0.01,1.5,length.out = 30)
##D three_circle_pt <- computept(three_circle_dat,sp=spseq,lim=lim,by=by,par=TRUE)
## End(Not run)

# draw terrace area plot
terracearea(three_circle_pt,dimension=1)
# draw persistence terrace, satellite view
plotpt(three_circle_pt,dimension=1)
# draw persistence terrace, overall view
plotpt(three_circle_pt,dimension=1,satellite=FALSE)



