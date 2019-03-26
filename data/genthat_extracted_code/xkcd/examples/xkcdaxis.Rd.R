library(xkcd)


### Name: xkcdaxis
### Title: Plot the axis
### Aliases: xkcdaxis

### ** Examples

## Not run: 
##D xrange <- range(mtcars$mpg)
##D yrange <- range(mtcars$wt)
##D p <- ggplot() +
##D      geom_point(aes(mpg, wt), data=mtcars) +
##D      xkcdaxis(xrange,yrange)
##D p
## End(Not run)



