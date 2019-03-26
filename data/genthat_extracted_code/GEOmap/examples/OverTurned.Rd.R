library(GEOmap)


### Name: OverTurned
### Title: Plot Overturned fault
### Aliases: OverTurned
### Keywords: aplot

### ** Examples


plot(c(-5,5), c(-5,5), asp=1, type='n' )
ff=list()
ff$x=c(-4.850,-4.700,-3.934,-2.528, 0.603, 2.647, 3.861, 2.626)
ff$y=c(-4.045,-2.087,-0.710, 0.172, 1.291, 2.087,-0.753,-4.131)


OverTurned(ff$x,ff$y,  r1= .4, r2= .8, h1= .5, h2= .5, N=5, syn=FALSE,
endtol=.2)






