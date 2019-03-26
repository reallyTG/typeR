library(netdiffuseR)


### Name: diffusionMap
### Title: Creates a heatmap based on a graph layout and a vertex attribute
### Aliases: diffusionMap diffmap diffusionMap.default diffusionMap.diffnet
###   image.diffnet_diffmap print.diffnet_diffmap plot.diffnet_diffmap

### ** Examples


# Example with a random graph --------------------------------------------------

## Not run: 
##D set.seed(1231)
##D 
##D # Random scale-free diffusion network
##D x <- rdiffnet(1000, 4, seed.graph="scale-free", seed.p.adopt = .025,
##D                            rewire = FALSE, seed.nodes = "central",
##D                            rgraph.arg=list(self=FALSE, m=4),
##D                            threshold.dist = function(id) runif(1,.2,.4))
##D 
##D # Diffusion map (no random toa)
##D dm0 <- diffusionMap(x, kde2d.args=list(n=150, h=.5), layout=igraph::layout_with_fr)
##D 
##D # Random
##D diffnet.toa(x) <- sample(x$toa, size = nnodes(x))
##D 
##D # Diffusion map (random toa)
##D dm1 <- diffusionMap(x, layout = dm0$coords, kde2d.args=list(n=150, h=.5))
##D 
##D oldpar <- par(no.readonly = TRUE)
##D col <- colorRampPalette(blues9)(100)
##D par(mfrow=c(1,2), oma=c(1,0,0,0))
##D image(dm0, col=col, main="Non-random Times of Adoption\nAdoption from the core.")
##D image(dm1, col=col, main="Random Times of Adoption")
##D par(mfrow=c(1,1))
##D mtext("Both networks have the same distribution on times of adoption", 1,
##D       outer = TRUE)
##D par(oldpar)
## End(Not run)

# Example with Brazilian Farmers --------------------------------------------
## Not run: 
##D dn <- brfarmersDiffNet
##D 
##D # Setting last TOA as NA
##D diffnet.toa(dn)[dn$toa == max(dn$toa)] <-
##D   NA
##D 
##D # Coordinates
##D coords <- sna::gplot.layout.fruchtermanreingold(
##D   as.matrix(dn$graph[[1]]), layout.par=NULL
##D )
##D 
##D # Plotting diffusion
##D plot_diffnet2(dn, layout=coords, vertex.size = 300)
##D 
##D # Adding diffusion map
##D out <- diffusionMap(dn, layout=coords, kde2d.args=list(n=100, h=50))
##D col <- adjustcolor(colorRampPalette(c("white","lightblue", "yellow", "red"))(100),.5)
##D with(out$map, .filled.contour(x,y,z,pretty(range(z), 100),col))
## End(Not run)




