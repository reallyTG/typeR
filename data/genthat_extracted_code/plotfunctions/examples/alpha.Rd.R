library(plotfunctions)


### Name: alpha
### Title: Adjusting the transparency of colors.
### Aliases: alpha

### ** Examples

emptyPlot(100,100, h=50, v=50)
rect(25,25,75,75, col=alpha('red',f=1))
rect(35,41,63,81, col=alpha(rgb(0,1,.5),f=.25), 
   border=alpha(rgb(0,1,.5), f=.65), lwd=4)

emptyPlot(1,1, axes=FALSE, main="Tunnel of 11 squares")
center <- c(.75, .25)
mycol <- "steelblue"
for(i in seq(0,1,by=.1)){
    rect(center[1]-center[1]*(1.1-i), center[2]-center[2]*(1.1-i), 
        center[1]+(1-center[1])*(1.1-i), center[2]+(1-center[2])*(1.1-i), 
        col=alpha(mycol, f=i), border=mycol, lty=1, lwd=.5, xpd=TRUE)
}
axis(1, at=center[1]-center[1]*(1.1-seq(0,1,by=.1)), labels=seq(0,1,by=.1))

# see alphaPalette for an elaboration of this example




