library(ndtv)


### Name: render.animation
### Title: Render animations of 'networkDynamic' objects as movies in
###   various formats
### Aliases: render.animation

### ** Examples


require(ndtv)
# trivial example

triangle <- network.initialize(3) # create a toy network
add.edge(triangle,1,2)
# add an edge between vertices 1 and 2
add.edge(triangle,2,3)
# add a more edges
activate.edges(triangle,at=1) # turn on all edges at time 1 only
activate.edges(triangle,onset=2, terminus=3,
e=get.edgeIDs(triangle,v=1,alter=2))
add.edges.active(triangle,onset=4, length=2,tail=3,head=1)
render.animation(triangle)
ani.replay() 

# an example with changing TEA attributes
wheel <- network.initialize(10)  # create a toy network
add.edges.active(wheel,tail=1:9,head=c(2:9,1),onset=1:9, terminus=11)
add.edges.active(wheel,tail=10,head=c(1:9),onset=10, terminus=12)
# set a dynamic value for edge widths
activate.edge.attribute(wheel,'width',1,onset=0,terminus=3) 
activate.edge.attribute(wheel,'width',5,onset=3,terminus=7)
activate.edge.attribute(wheel,'width',10,onset=3,terminus=Inf)
# set a value for vertex sizes
activate.vertex.attribute(wheel,'mySize',1, onset=-Inf,terminus=Inf)
activate.vertex.attribute(wheel,'mySize',3, onset=5,terminus=10,v=4:8)
# set values for vertex colors
activate.vertex.attribute(wheel,'color','gray',onset=-Inf,terminus=Inf)
activate.vertex.attribute(wheel,'color','red',onset=5,terminus=6,v=4)
activate.vertex.attribute(wheel,'color','green',onset=6,terminus=7,v=5)
activate.vertex.attribute(wheel,'color','blue',onset=7,terminus=8,v=6)
activate.vertex.attribute(wheel,'color','pink',onset=8,terminus=9,v=7)
# render it all
render.animation(wheel,edge.lwd='width',vertex.cex='mySize',vertex.col='color')


# an example with functional attributes
set.network.attribute(wheel,'slice.par',
           list(start=1,end=10,interval=1, aggregate.dur=1,rule='latest'))
# render vertex size as betweeness
render.animation(wheel,vertex.cex=function(slice){(betweenness(slice)+1)/5})


# render it directly to a movie file without caching the plots (faster)
## Not run: 
##D saveVideo( render.animation(wheel,edge.lwd='width',vertex.cex='mySize',vertex.col='color',
##D            render.cache='none') )
## End(Not run)

# simulation based example
# disabled to save time when testing
## Not run: 
##D require(tergm)
##D # load in example data, results of a basic stergm sim
##D data(stergm.sim.1)
##D 
##D # (optional) pre-compute coordinates for set time range
##D # (optional) limit time range to a few steps to speek example
##D slice.par=list(start=0,end=10,interval=1, aggregate.dur=1,rule='latest')
##D compute.animation(stergm.sim.1,slice.par=slice.par)
##D 
##D 
##D # define the number of inbetween frames and a formula for stats to display
##D render.par<-list(tween.frames=5,show.time=TRUE,
##D                 show.stats="~edges+gwesp(0,fixed=TRUE)")
##D                 
##D # render the movie, with labels, smaller vertices, etc
##D render.animation(stergm.sim.1,render.par=render.par,
##D                  edge.col="darkgray",displaylabels=TRUE,
##D                  label.cex=.6,label.col="blue")
##D                  
##D # preview the movie in the plot window
##D ani.replay()     
##D 
##D # save the movie as mp4 compressed video (if FFMPEG installed)
##D saveVideo(ani.replay(),video.name="stergm.sim.1.mp4", 
##D            other.opts="-b 5000k",clean=TRUE)
## End(Not run)




