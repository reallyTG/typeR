library(spatstat)


### Name: spatstat.options
### Title: Internal Options in Spatstat Package
### Aliases: spatstat.options reset.spatstat.options
### Keywords: spatial

### ** Examples

  # save current values
  oldopt <- spatstat.options()

  spatstat.options("npixel")
  spatstat.options(npixel=150)
  spatstat.options(npixel=c(100,200))

  spatstat.options(par.binary=list(col=grey(c(0.5,1))))

  spatstat.options(par.persp=list(theta=-30,phi=40,d=4))
  # see help(persp.default) for other options

  # revert
  spatstat.options(oldopt)




