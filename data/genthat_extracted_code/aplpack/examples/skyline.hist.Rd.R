library(aplpack)


### Name: skyline.hist
### Title: 'skyline.hist' computes a skyline plot which is special
###   histogram.
### Aliases: skyline.hist
### Keywords: misc hplot

### ** Examples

  # dev.off()
print(par())
  par(mfrow=c(1,1))
  for(n.c in c(2,4,8)){  # some values for n.class
    for(n.h in c(2,4,3)){# some values for number of n.hist
        n.s <- 9         # value for number of vertical lines
        skyline.hist(co2, n.shading = n.s, n.hist = n.h ,n.class = n.c, 
                     night = n.h==3, col.border = n.h!=4)
    }
  }
  par(mfrow = c(1,1))
  skyline.hist(x=rivers, n.class=4, n.hist=2, n.shading=0, main="rivers",
             cex.data=.5, lwd.data = .2, col.data = "green", pcol.data = "red",
             col.border=NA, night=FALSE, ylab="density")
  skyline.hist(x=rivers, n.class=4, n.hist=5, n.shading=0, main="rivers",
             cex.data=.5, lwd.data = 1, col.data = "green", pcol.data = "red",
             col.border=NA, night="blue" , ylab="density", col.bars =NA)
  skyline.hist(x=rivers, n.class=10, n.hist=2, n.shading=0, main="rivers",
             cex.data=.5, lwd.data = 1, col.data = "green", pcol.data = "red",
             col.border=NA, night=FALSE , ylab="density", col.bars = "lightblue")
  skyline.hist(x=rivers, n.class=10, n.hist=1, n.shading=0, main="rivers",
             cex.data=1, lwd.data = 0, col.data = "green", pcol.data = "red",
             col.border=NA, night=FALSE , ylab="density", col.bars = "lightblue" )
  skyline.hist(x=rivers, n.class=6, n.hist=1, n.shading=0, main="rivers",
             cex.data=0.1, lwd.data = 2, col.data = "red", pcol.data = "green",
             night="orange" , ylab="density", col.bars = "white", col.border=1 )
  skyline.hist(x=rivers, n.class=6, n.hist=1, n.shading=0, main="rivers",
             cex.data=0.1, lwd.data = 2, col.data = "red", pcol.data = "green",
             col.border=NA, night=FALSE , ylab="density", col.bars = "lightblue")
  skyline.hist(x=rivers, n.class=6, n.hist=1, n.shading=5, col.shading = "blue",
             main="rivers",
             cex.data=0.1, lwd.data = 1, col.data = "black", pcol.data = "green",
             col.border=NA, night=FALSE , ylab="density", col.bars = "green")
  skyline.hist(x=rivers, n.class=6, n.hist=3, n.shading=5, col.shading = "blue",
             main="rivers", col.bars = "green",
             cex.data=0.1, lwd.data = 1, col.data = "black", pcol.data = "green",
             col.border="white", night="magenta" , ylab="density")
  skyline.hist(x=rivers, n.class=6, n.hist=4, n.shading=5, col.shading = "blue",
             main="rivers",
             cex.data=0.8, lwd.data = 1, col.data = "blue", pcol.data = "red",
             col.border=NA, night=FALSE , ylab="density", col.bars = "green")



