library(netdiffuseR)


### Name: rescale_vertex_igraph
### Title: Rescale vertex size to be used in 'plot.igraph'.
### Aliases: rescale_vertex_igraph igraph_vertex_rescale
###   vertex_rescale_igraph

### ** Examples


library(igraph)

# Random graph and coordinates
set.seed(2134)
g <- barabasi.game(10)
coords <- layout_nicely(g)

# Random size and figures
size <- runif(10)
size <- cbind(size, size)
shap <- sample(c("circle", "square"),10,TRUE)

# Plotting
oldpar <- par(no.readonly = TRUE)
par(mfrow=c(2,2), mai=rep(.5,4))
for (i in seq(1, 1000, length.out = 4)) {
  # New plot-window
  plot.new()
  plot.window(xlim=range(coords[,1]*i), ylim=range(coords[,2]*i))

  # plotting graph
  plot(g, layout=coords*i, add=TRUE, rescale=FALSE,
       vertex.shape = shap,
       vertex.size  = rescale_vertex_igraph(size) # HERE WE RESCALE!
  )

  # Adding some axis
  axis(1, lwd=0, lwd.ticks = 1)
  axis(2, lwd=0, lwd.ticks = 1)
  box()
}

par(oldpar)




