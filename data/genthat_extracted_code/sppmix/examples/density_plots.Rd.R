library(sppmix)


### Name: plot.normmix
### Title: Plot a mixture of normal components
### Aliases: plot.normmix

### ** Examples

## No test: 
# plot normmix density
truemix<- rnormmix(m = 3, sig0 = .1, df = 5, xlim= c(-1, 2), ylim = c(-1, 2))
summary(truemix)
#plot the normal mixture
plot(truemix, xlim= c(-1, 2), ylim = c(-1,2),
 title1="True mixture density in 3d")+add_title(
 "True mixture of normals density")
plot(truemix,xlim= c(-1, 2), ylim = c(-1, 2),contour = TRUE)+add_title(
 "Contour plot of the true mixture of normals density")
#build a mixture intensity surface for the Poisson point process
trueintsurf=to_int_surf(truemix, lambda = 100, win=
 spatstat::owin( c(-1, 2),c(-1, 2)))
plot(trueintsurf)#plot the surface, it is lambda*normmix
## End(No test)




