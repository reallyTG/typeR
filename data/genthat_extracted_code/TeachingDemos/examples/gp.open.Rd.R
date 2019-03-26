library(TeachingDemos)


### Name: gp.open
### Title: Alpha version functions to send plotting commands to GnuPlot
### Aliases: gp.open gp.close gp.send gp.plot gp.splot
### Keywords: hplot

### ** Examples

 ## Not run: 
##D 
##D x <- 1:10
##D y <- 3-2*x+x*x+rnorm(10)
##D 
##D gp.open()
##D gp.plot(x,y)
##D gp.send('replot 3-2*x+x**2')
##D 
##D tmp <- expand.grid(x=1:10, y=1:10)
##D tmp <- transform(tmp, z=(x-5)*(y-3))
##D gp.splot(tmp$x, tmp$y, tmp$z)
##D 
##D gp.close()
##D  
## End(Not run)



