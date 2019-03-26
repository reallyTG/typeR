library(treespace)


### Name: treespace
### Title: Phylogenetic tree exploration
### Aliases: treespace

### ** Examples


## generate list of trees
x <- rmtree(10, 20)
names(x) <- paste("tree", 1:10, sep = "")

## use treespace
res <- treespace(x, nf=3)
table.paint(as.matrix(res$D))
scatter(res$pco)

data(woodmiceTrees)
woodmiceDists <- treespace(woodmiceTrees,nf=3)
plot(woodmiceDists$pco$li[,1],woodmiceDists$pco$li[,2])
woodmicedf <- woodmiceDists$pco$li
if(require(ggplot2)){
woodmiceplot <- ggplot(woodmicedf, aes(x=A1, y=A2)) # create plot
woodmiceplot + geom_density2d(colour="gray80") + # contour lines
geom_point(size=6, shape=1, colour="gray50") + # grey edges
geom_point(size=6, alpha=0.2, colour="navy") + # transparent blue points
xlab("") + ylab("") + theme_bw(base_family="") # remove axis labels and grey background
}

## Not run: 
##D if(require(rgl)){
##D plot3d(woodmicedf[,1], woodmicedf[,2], woodmicedf[,3], type="s", size=1.5,
##D col="navy", alpha=0.5, xlab="", ylab="", zlab="")
##D }
## End(Not run)





