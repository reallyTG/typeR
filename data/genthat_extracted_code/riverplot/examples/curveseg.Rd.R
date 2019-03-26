library(riverplot)


### Name: curveseg
### Title: Draw a curved segment
### Aliases: curveseg

### ** Examples

# a DNA strand
plot.new()
par( usr= c( 0, 4, -2.5, 2.5 ) )

w    <- 0.4
cols <- c( "blue", "green" )
init <- c( -0.8, -0.5 )
pos  <- c( 1, -1 )
step <- 0.5

for( i in rep( rep( c( 1, 2 ), each= 2 ), 5 ) ) {
  curveseg( init[i], init[i] + step, pos[1], pos[2], width= w, col= cols[i] )
  init[i] <- init[i] + step
  pos <- pos * -1
}



