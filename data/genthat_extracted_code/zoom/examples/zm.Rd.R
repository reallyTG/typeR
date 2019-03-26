library(zoom)


### Name: zm
### Title: Launch interaction on a plot
### Aliases: zm
### Keywords: navigate navigation plot zm zoom

### ** Examples

## Not run: 
##D # basic example
##D plot(rnorm(1000),rnorm(1000)) # could be any plot
##D zm() # navigate the plot
##D 
##D # use the same xlim/ylim as ended up in the zoom session
##D xylim<-par("usr") # xmin,xmax,ymin,ymax of the final version of the plot
##D dev.off()
##D plot(rnorm(1000),rnorm(1000),xlim=xylim[1:2],ylim=xylim[3:4])
##D 
##D # navigate two layers of data at the same time
##D par(mfrow=c(1,2))
##D plot(1,type="n",xlim=c(-3,3),ylim=c(-3,3),main="First Track")
##D polygon(c(-1,1,1,-1)*2,c(-1,-1,1,1)*2,col="blue")
##D lines(rnorm(100),rnorm(100))
##D plot(1,type="n",xlim=c(-3,3),ylim=c(-3,3),main="Second Track")
##D polygon(c(-1,1,1,-1)*2,c(-1,-1,1,1)*2,col="green")
##D lines(rnorm(100),rnorm(100))
##D zm() # it flickers quite a bit as it needs to replot everything every time...
##D 
##D # one might want to use the older interface
##D # if attached to cairo under linux or MacOS
##D # it is also sometimes helpful to just define a square you want to zoom on
##D zm(type="s")
## End(Not run)



