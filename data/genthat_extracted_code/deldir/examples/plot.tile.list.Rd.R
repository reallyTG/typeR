library(deldir)


### Name: plot.tile.list
### Title: Plot Dirchlet (Voronoi) tiles
### Aliases: plot.tile.list
### Keywords: hplot

### ** Examples

  set.seed(42)
  x <- runif(20)
  y <- runif(20)
  z <- deldir(x,y,rw=c(0,1,0,1))
  w <- tile.list(z)
  plot(w)
  ccc <- heat.colors(20) # Or topo.colors(20), or terrain.colors(20)
                         # or cm.colors(20), or rainbow(20).
  plot(w,fillcol=ccc,close=TRUE)
  if(require(polyclip)) {
     CP <- list(x=c(0.49,0.35,0.15,0.20,0.35,0.42,
                          0.43,0.62,0.46,0.63,0.82,0.79),
                      y=c(0.78,0.86,0.79,0.54,0.58,0.70,
                          0.51,0.46,0.31,0.20,0.37,0.54))
     plot(w,clipp=CP,showpoints=FALSE,fillcol=topo.colors(20))
  }
  plot(w,number=TRUE,col.num="red")
  plot(w,number=TRUE,col.num="red",cex=0.5)
  plot(w,showpoints=TRUE,number=TRUE,col.pts="green",col.num="red")



