library(TeachingDemos)


### Name: zoomplot
### Title: Zoom or unzoom an existing plot in the plot window
### Aliases: oldzoomplot zoomplot
### Keywords: dplot iplot

### ** Examples

if(interactive()){

with(iris, plot(Sepal.Length, Petal.Width,
    col=c('red','green','blue')[Species]))
text( 6.5, 1.5, 'test' )
zoomplot( locator(2) ) # now click on 2 points in the plot to zoom in

plot( 1:10, rnorm(10) )
tmp <- rnorm(10,1,3)
lines( (1:10) + 0.5, tmp, col='red' )
zoomplot( c(0,11), range(tmp) )
}



