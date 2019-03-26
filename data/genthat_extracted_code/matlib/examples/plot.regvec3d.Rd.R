library(matlib)


### Name: plot.regvec3d
### Title: Plot method for regvec3d objects
### Aliases: plot.regvec3d summary.regvec3d print.regvec3d

### ** Examples

if (require(carData)) {
   data("Duncan", package="carData")
   dunc.reg <- regvec3d(prestige ~ income + education, data=Duncan)
   plot(dunc.reg)
   plot(dunc.reg, dimension=2)
   plot(dunc.reg, error.sphere="e")
   summary(dunc.reg)

   # Example showing Simpson's paradox
   data("States", package="carData")
   states.vec <- regvec3d(SATM ~ pay + percent, data=States, scale=TRUE)
   plot(states.vec, show.marginal=TRUE)
   plot(states.vec, show.marginal=TRUE, dimension=2)
   summary(states.vec)
}



