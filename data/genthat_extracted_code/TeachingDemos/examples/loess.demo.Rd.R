library(TeachingDemos)


### Name: loess.demo
### Title: Demonstrate the internals of loess curve fits
### Aliases: loess.demo
### Keywords: hplot dynamic iplot

### ** Examples


if(interactive()){
data(ethanol, package='lattice')
attach(ethanol)
loess.demo(E, NOx)
# now click a few places, right click to end
loess.demo(E, NOx, span=1.5)
loess.demo(E, NOx, span=0.25)
loess.demo(E, NOx, degree=0)
loess.demo(E, NOx, degree=2)
detach()
}



