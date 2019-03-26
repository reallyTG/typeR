library(pterrace)


### Name: four_feature_dat
### Title: Point cloud of four features; square, circle, equilateral and
###   isosceles triangles
### Aliases: four_feature_dat
### Keywords: datasets

### ** Examples

# load four feature dat
data(four_feature_dat)

# input variables
Xlim <- c(-7,5)
Ylim <- c(-5,6)
lim <- cbind(Xlim, Ylim)
by <- 0.2
spseq <- seq(0.01,0.6,length.out = 10)

# compute barcodes
four_feature_pt <- computept(four_feature_dat,sp=spseq,lim=lim,by=by)

## Not run: 
##D # compute persistence terrace with parallel option
##D spseq <- seq(0.01,0.6,length.out = 30)
##D two_circle_density_pt <- computept(four_feature_dat,sp=spseq,lim=lim,by=by,par=TRUE)
## End(Not run)

## draw area plot
terracearea(four_feature_pt,dimension=1,maxheight=20)
## draw persistence terrace
plotpt(four_feature_pt,cmax=6,dimension=1)



