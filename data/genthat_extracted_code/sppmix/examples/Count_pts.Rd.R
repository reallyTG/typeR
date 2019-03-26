library(sppmix)


### Name: Count_pts
### Title: Counts points in a window
### Aliases: Count_pts

### ** Examples

## No test: 
truemix_surf=rmixsurf(m = 3,lambda=100, xlim=c(-5,5),ylim=c(-5,5))
genPP=rsppmix(truemix_surf)
plotmix_2d(truemix_surf,genPP)
Count_pts(genPP,spatstat::square(1))
Count_pts(genPP,spatstat::square(2))
Count_pts(genPP,spatstat::square(3))
Count_pts(genPP,spatstat::square(4))
Count_pts(genPP,spatstat::square(5))
Count_pts(genPP,spatstat::owin(c(-5,5),c(-5,5)))
## End(No test)




