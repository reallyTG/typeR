library(rje)


### Name: cubeHelix
### Title: Cube Helix colour palette
### Aliases: cubeHelix
### Keywords: color

### ** Examples

cubeHelix(21)

## Not run: 
##D cols = cubeHelix(101)
##D 
##D plot.new()
##D plot.window(xlim=c(0,1), ylim=c(0,1))
##D axis(side=1)
##D for (i in 1:101) {
##D   rect((i-1)/101,0,(i+0.1)/101,1, col=cols[i], lwd=0)
##D }
## End(Not run)

## Not run: 
##D require(grDevices)
##D # comparison with other palettes
##D n = 101
##D cols = cubeHelix(n)
##D heat = heat.colors(n)
##D rain = rainbow(n)
##D terr = terrain.colors(n)
##D 
##D plot.new()
##D plot.window(xlim=c(-0.5,1), ylim=c(0,4))
##D axis(side=1, at=c(0,1))
##D axis(side=2, at=1:4-0.5, labels=1:4, pos=0)
##D for (i in 1:n) {
##D   rect((i-1)/n,3,(i+0.1)/n,3.9, col=cols[i], lwd=0)
##D   rect((i-1)/n,2,(i+0.1)/n,2.9, col=heat[i], lwd=0)
##D   rect((i-1)/n,1,(i+0.1)/n,1.9, col=rain[i], lwd=0)
##D   rect((i-1)/n,0,(i+0.1)/n,0.9, col=terr[i], lwd=0)
##D }
##D legend(-0.6,4,legend=c("4. cube helix", "3. heat", "2. rainbow", "1. terrain"), box.lwd=0)
## End(Not run)




