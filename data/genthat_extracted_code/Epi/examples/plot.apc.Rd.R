library(Epi)


### Name: plot.apc
### Title: Plot the estimates from a fitted Age-Period-Cohort model
### Aliases: plot.apc apc.plot
### Keywords: hplot

### ** Examples

data( lungDK )
apc1 <- apc.fit( transform( lungDK,
                            A = Ax, P = Px, Y = Y/10^5 ),
                 ref.c = 1920 )
fp <- apc.plot( apc1 )
apc.lines( apc1, frame.par=fp, drift=1.01, col="red" )
for( i in 1:11 )
  apc.lines( apc1, frame.par=fp, drift=1+(i-6)/100, col=rainbow(12)[i] )



