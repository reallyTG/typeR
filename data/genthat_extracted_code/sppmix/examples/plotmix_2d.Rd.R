library(sppmix)


### Name: plotmix_2d
### Title: 2d exploratory plots for mixture intensity surfaces
### Aliases: plotmix_2d

### ** Examples

## No test: 
# plot normmix density
truemix<- rnormmix(m = 3, sig0 = .1, df = 5, xlim= c(0, 5), ylim = c(0, 5))
summary(truemix)
intsurf=to_int_surf(truemix, lambda = 100, win =spatstat::owin( c(0, 5),c(0, 5)))
#plot the intensity surface
plotmix_2d(intsurf)
plotmix_2d(intsurf,contour = TRUE)
pp1 <- rsppmix(intsurf = intsurf)# draw points
plotmix_2d(intsurf, pp1)
plotmix_2d(intsurf, pp1,contour = TRUE)
#fit a Poisson with mixture intensity surface
CAgens=est_mix_damcmc(pp = CAQuakes2014.RichterOver3.0, m = 5)
#retrieve the surface of posterior means
CAfit=GetPMEst(CAgens)
#plot the surface and the point pattern
plotmix_2d(CAfit,CAQuakes2014.RichterOver3.0)
#to include the state boundaries use function PlotUSAStates
ret=PlotUSAStates(states=c('California','Nevada','Arizona'), showcentroids=FALSE,
 shownames=TRUE, main="Earthquakes in CA, 2014", pp=CAQuakes2014.RichterOver3.0,
 surf=CAfit, boundarycolor="white", namescolor="white")
#plotting the points with different colors depending on the component they belong to
truemix <- rnormmix(m = 5, sig0 = .1, df = 5, xlim=c(-2,2), ylim=c(-2,2))
intsurf=to_int_surf(truemix, lambda = 100, win = spatstat::owin(c(-2,2),c(-2,2)))
pp1 <- rsppmix(intsurf)
#plot the points with different colors depending on the true component label
plotmix_2d(intsurf,pp1, colors = TRUE)
#plot the points with different colors depending on the estimated component label
fit <- est_mix_damcmc(pp1, 5)
est_comp <- GetMAPLabels(fit)
plotmix_2d(intsurf,pp1, estcomp = est_comp, colors = TRUE)
plotmix_2d(intsurf,pp1, estcomp = est_comp, contour = TRUE,colors = TRUE)
## End(No test)




