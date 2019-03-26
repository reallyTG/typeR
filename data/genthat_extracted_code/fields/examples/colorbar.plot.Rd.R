library(fields)


### Name: colorbar.plot
### Title: Adds color scale strips to an existing plot.
### Aliases: colorbar.plot
### Keywords: hplot

### ** Examples

# set up a plot but don't plot points  and no "box"
plot( 1:10, (1:10)*10, type="n", bty="n") 
# of course this could be anything 

y<- cbind( 1:15, (1:15)+25)

colorbar.plot( 2.5, 30, y)
points( 2.5,30, pch="+", cex=2, adj=.5)
# note that strip is still in 1:8 aspect even though plot has very 
# different ranges for x and y. 

# adding legend using image.plot
zr<- range( c( y))
image.plot( legend.only=TRUE, zlim= zr) 
# see help(image.plot) to create more room in margin etc. 

zr<- rbind( c(1,20), c(1,100)) # separate ranges for columns of y. 
colorbar.plot( 5, 70, y, adj.x=0, zrange= zr)
# some reference lines to show placement
xline( 5, lty=2) # strip starts at x=5 
yline(70, lty=2)  # strip is centered around y=7 (because adj.y=.5 by default)

# many strips on common scale.

y<- matrix( 1:200, ncol=10)
colorbar.plot( 2, 75, y, horizontal=FALSE, col=rainbow(256)) 

# Xmas strip
y<- cbind( rep( c(1,2),10))
y[15] <- NA # NA's should work 
colorbar.plot( 6, 45, y, adj.y=1,col=c("red", "green"))
text(6,48,"Christmas strip", cex=2)

# lennon thumbnail
# there are better ways to this ... see add.image for example.
data( lennon)
colorbar.plot( 7.5,22, lennon, 
           strip.width=.25, strip.length=.25, col=grey(seq( 0,1,,256)))




