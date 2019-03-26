library(sppmix)


### Name: rsppmix
### Title: Generate a point pattern from a Poisson process
### Aliases: rsppmix summary.sppmix

### ** Examples

## No test: 
# create the true mixture
truemix_surf <- normmix(ps=c(.2, .6,.2), mus=list(c(0.3, 0.3), c(0.7, 0.7), c(0.5, 0.5)),
 sigmas = list(.01*diag(2), .03*diag(2), .02*diag(2)), lambda=100, win=spatstat::square(1))
plot(truemix_surf)
# generate the point pattern
genPPP1=rsppmix(truemix_surf)
summary(genPPP1)
plot2dPP(genPPP1)
plot2dPP(genPPP1,truemix_surf$mus)
plotmix_2d(truemix_surf,genPPP1)
# overwrite lambda or win
genPPP2=rsppmix(truemix_surf, lambda = 200)
plotmix_2d(truemix_surf,genPPP2)
genPPP3=rsppmix(truemix_surf, win = spatstat::square(2))
truemix_surf$window
plotmix_2d(truemix_surf,genPPP3)#will not see the points outside the surface window
plotmix_2d(truemix_surf,genPPP3, win = spatstat::square(2)) #have to pass the new window
#to see the points
#use normmix with additional parameters
truemix<- rnormmix(m = 3, sig0 = .1, df = 5, xlim= c(0, 3), ylim = c(0, 3))
plot(truemix)
normdens=dnormmix(truemix, xlim= c(0, 3), ylim = c(0, 3))
plotmix_3d(normdens)
genPPP4=rsppmix(truemix, lambda = 100, win = spatstat::square(3))
# turn off truncation
genPPP5=rsppmix(intsurf = truemix_surf, truncate = FALSE)
plotmix_2d(truemix_surf,genPPP5)
plotmix_2d(truemix_surf,genPPP5, win = spatstat::square(2))
plotmix_2d(truemix_surf,genPPP5,contour=TRUE)
intsurf6=rmixsurf(m=5,lambda=rgamma(1,shape=10,scale=5),
 df=5,sig0=1,rand_m=TRUE,mu0 = c(.5,.5),Sigma0 = 0.001*diag(2))
genPPP6=rsppmix(intsurf6,marks=1:3,truncate = FALSE)
plotmix_2d(intsurf6,genPPP6)
plot(genPPP6,showmarks=TRUE)
## End(No test)



