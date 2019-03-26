library(pterrace)


### Name: two_circle_noise_added_dat
### Title: Point cloud of two circles of different size and density with
###   noise
### Aliases: two_circle_noise_added_dat
### Keywords: datasets

### ** Examples

# load data
data(two_circle_noise_added_dat)

# input variables
Xlim <- c(-3,4)
Ylim <- c(-3,3)
lim <- cbind(Xlim, Ylim)
by <- 0.05
spseq <- seq(0.01,0.7,length.out=100)

# compute persistence terrace with parallel option
## Not run: 
##D two_circle_noise_pt <- computept(two_circle_noise_added_dat,sp=spseq,lim=lim,by=by,par=TRUE)
##D 
##D # draw persistence terrace, satellite view
##D plotpt(two_circle_noise_pt,dimension=1)
## End(Not run)



