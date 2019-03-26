library(kmlShape)


### Name: reduceNbTimes
### Title: ~ Function: reduceNbTimes ~
### Aliases: reduceNbTimes

### ** Examples

  require(lattice)

  ### Some artificial data
  g <- function(x)dnorm(x,3)+dnorm(x,7)+x/10
  dn <- data.frame(id=rep(1:20,each=101),
    times=rep((0:100)/10,times=20),
    traj=rep(g((0:100)/10),20)+rep(runif(20),each=101)+rnorm(20*101,,0.1))

  xyplot(traj ~ times, data=dn, groups=id,type="l")

  ### Reduction to 50 points
  dn2 <- reduceNbTimes(trajLong=dn,nbPoints=50)
  xyplot(traj ~ times, data=dn2, groups=id,type="l")

  ### Reduction to 20 points
  dn3 <- reduceNbTimes(trajLong=dn,nbPoints=20)
  xyplot(traj ~ times, data=dn3, groups=id,type="l")

  ### Smoothing then reduction to 20 points
  dn4 <- reduceNbTimes(trajLong=dn,nbPoints=20,spar=0.5)
  xyplot(traj ~ times, data=dn4, groups=id,type="l")



