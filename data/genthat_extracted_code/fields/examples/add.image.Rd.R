library(fields)


### Name: add.image
### Title: Adds an image to an existing plot.
### Aliases: add.image
### Keywords: hplot

### ** Examples

plot( 1:10, 1:10, type="n")
data( lennon)

add.image( 5,4,lennon, col=grey( (0:256)/256))
# reference lines 
xline( 5, col=2)
yline( 4,col=2) 

#
# add lennon right in the corner beyond the plotting region
# 

par(new=TRUE, plt=c(0,1,0,1), mar=c(0,0,0,0), usr=c(0,1,0,1))
add.image( 0,0, lennon, adj.x=0, adj.y=0) 




