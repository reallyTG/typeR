library(sppmix)


### Name: add_title
### Title: Add a title to an existing ggplot2 plot
### Aliases: add_title

### ** Examples

## No test: 
truemix = rnormmix(m = 5, sig0 = .1, df = 5,xlim= c(0, 3), ylim = c(0, 3))
intsurf=to_int_surf(truemix,lambda = 100,win=spatstat::owin( c(0, 5),c(0, 5)))
#plot the intensity surface
plotmix_2d(intsurf)+add_title("A pretty projection of the 3d surface to 2 dimensions")
## End(No test)




