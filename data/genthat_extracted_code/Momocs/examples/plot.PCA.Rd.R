library(Momocs)


### Name: plot.PCA
### Title: Plots Principal Component Analysis
### Aliases: plot.PCA

### ** Examples

## Not run: 
##D bot.f <- efourier(bot, 12)
##D bot.p <- PCA(bot.f)
##D 
##D ### Morphospace options
##D plot(bot.p, pos.shp="full")
##D plot(bot.p, pos.shp="range")
##D plot(bot.p, pos.shp="xy")
##D plot(bot.p, pos.shp="circle")
##D plot(bot.p, pos.shp="range_axes")
##D plot(bot.p, pos.shp="full_axes")
##D 
##D plot(bot.p, morpho=FALSE)
##D 
##D ### Passing factors to plot.PCA
##D # 3 equivalent methods
##D plot(bot.p, "type")
##D plot(bot.p, 1)
##D plot(bot.p, ~type)
##D 
##D # let's create a dummy factor of the correct length
##D # and another added to the $fac with mutate
##D # and a numeric of the correct length
##D f <- factor(rep(letters[1:2], 20))
##D z <- factor(rep(LETTERS[1:2], 20))
##D bot %<>% mutate(cs=coo_centsize(.), z=z)
##D bp <- bot %>% efourier %>% PCA
##D # so bp contains type, cs (numeric) and z; not f
##D # yet f can be passed on the fly
##D plot(bp, f)
##D # numeric fac are allowed
##D plot(bp, "cs", cex=3, color.legend=TRUE)
##D # formula allows combinations of factors
##D plot(bp, ~type+z)
##D 
##D ### other morphometric approaches works the same
##D # open curves
##D op <- npoly(olea, 5)
##D op.p <- PCA(op)
##D op.p
##D plot(op.p, ~ domes + var, morpho=TRUE) # use of formula
##D 
##D # landmarks
##D wp <- fgProcrustes(wings, tol=1e-4)
##D wpp <- PCA(wp)
##D wpp
##D plot(wpp, 1)
##D 
##D # traditionnal measurements
##D flower %>% PCA %>% plot(1)
##D 
##D # plot.PCA can be used after a PCA
##D PCA(iris[, 1:4], fac=iris$Species)  %>% plot(1)
##D 
##D ### Cosmetic options
##D # window
##D plot(bp, 1, zoom=2)
##D plot(bp, zoom=0.5)
##D plot(bp, center.origin=FALSE, grid=FALSE)
##D 
##D # colors
##D plot(bp, col="red") # globally
##D plot(bp, 1, col=c("#00FF00", "#0000FF")) # for every level
##D # a color vector of the right length
##D plot(bp, 1, col=rep(c("#00FF00", "#0000FF"), each=20))
##D # a color vector of the right length, mixign Rcolor names (not a good idea though)
##D plot(bp, 1, col=rep(c("#00FF00", "forestgreen"), each=20))
##D 
##D 
##D # ellipses
##D plot(bp, 1, conf.ellipsesax=2/3)
##D plot(bp, 1, ellipsesax=FALSE)
##D plot(bp, 1, ellipsesax=TRUE, ellipses=TRUE)
##D 
##D # stars
##D plot(bp, 1, stars=TRUE, ellipsesax=FALSE)
##D 
##D # convex hulls
##D plot(bp, 1, chull=TRUE)
##D plot(bp, 1, chull.lty=3)
##D 
##D # filled convex hulls
##D plot(bp, 1, chull.filled=TRUE)
##D plot(bp, 1, chull.filled.alpha = 0.8, chull.lty =1) # you can omit chull.filled=TRUE
##D 
##D # density kernel
##D plot(bp, 1, density=TRUE, contour=TRUE, lev.contour=10)
##D 
##D # delaunay
##D plot(bp, 1, delaunay=TRUE)
##D 
##D # loadings
##D flower %>% PCA %>% plot(1, loadings=TRUE)
##D 
##D # point/group labelling
##D plot(bp, 1, labelspoint=TRUE) # see options for abbreviations
##D plot(bp, 1, labelsgroup=TRUE) # see options for abbreviations
##D 
##D # clean axes, no rug, no border, random title
##D plot(bp, axisvar=FALSE, axisnames=FALSE, rug=FALSE, box=FALSE, title="random")
##D 
##D # no eigen
##D plot(bp, eigen=FALSE) # eigen cause troubles to graphical window
##D # eigen may causes troubles to the graphical window. you can try old.par = TRUE
## End(Not run)



