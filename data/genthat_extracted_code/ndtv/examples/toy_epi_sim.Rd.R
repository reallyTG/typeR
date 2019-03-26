library(ndtv)


### Name: toy_epi_sim
### Title: Toy Epidemic Simulation Output from the EpiModel package
### Aliases: toy_epi_sim
### Keywords: datasets

### ** Examples

data(toy_epi_sim)
timeline(toy_epi_sim)
## Not run: 
##D 
##D 
##D # set up layout to draw plots under timeline
##D layout(matrix(c(1,1,1,2,3,4),nrow=2,ncol=3,byrow=TRUE))
##D # plot a proximity.timeline illustrating infection spread
##D proximity.timeline(toy_epi_sim,vertex.col = 'ndtvcol',
##D                   spline.style='color.attribute',
##D                   mode = 'sammon',default.dist=100,
##D                   chain.direction='reverse')
##D # plot 3 static cross-sectional networks 
##D # (beginning, middle and end) underneath for comparison
##D plot(network.collapse(toy_epi_sim,at=1),vertex.col='ndtvcol',
##D        main='toy_epi_sim network at t=1')
##D plot(network.collapse(toy_epi_sim,at=17),vertex.col='ndtvcol',
##D        main='toy_epi_sim network at=17')
##D plot(network.collapse(toy_epi_sim,at=25),vertex.col='ndtvcol',
##D        main='toy_epi_sim network at t=25')
##D layout(1) # reset the layout
##D 
##D 
##D # render an animation of the network
##D render.animation(toy_epi_sim,vertex.col='ndtvcol',displaylabels=FALSE)
##D ani.replay()
## End(Not run)





