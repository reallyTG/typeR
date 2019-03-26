library(ndtv)


### Name: timeline
### Title: Plot a timeline for the edge and vertex spells of a network
### Aliases: timeline

### ** Examples

  data(stergm.sim.1)
  timeline(stergm.sim.1)
  
  # color vertices by priorates, don't show edges
  timeline(stergm.sim.1,vertex.col='priorates',plot.edge.spells=FALSE)
  
  # show only relationships among a few vertices
  timeline(stergm.sim.1,v=1:8)
  
  # zoom in on a region of time
  timeline(stergm.sim.1,xlim=c(20,40))
  
  # label vertices with numbers
  # and label edges by the tail and head vertices they link
  timeline(stergm.sim.1,xlim=c(0,5),v.label=1:network.size(stergm.sim.1),
      e.label=sapply(stergm.sim.1$mel,function(e){paste(e$inl,e$outl,sep='->')}) )
      
  # show only edge spells, hi-lite edge id 20
  set.edge.attribute(stergm.sim.1,'my_color','gray')
  set.edge.attribute(stergm.sim.1,'my_color','red',e=20)
  timeline(stergm.sim.1,edge.col='my_color',plot.vertex.spells=FALSE)
  
  # show binning over the edges
  timeline(stergm.sim.1,slice.par=list(start=0,
                                       end=100,
                                       interval=10, aggregate.dur=5,
                                       rule='latest'),
                      plot.vertex.spells=FALSE)



